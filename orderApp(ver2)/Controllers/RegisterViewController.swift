//
//  RegisterViewController.swift
//  orderApp(ver2)
//
//  Created by Роза Шархмуллина on 08.05.23.
//

import UIKit

class RegisterViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var usernameLabel: UITextField!
    @IBOutlet weak var emailLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var signUpButtonLabel: UIButton!
    @IBOutlet weak var privacyPolicy: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.privacyPolicy.delegate = self
        let attributedString = NSMutableAttributedString(string: "By creating an account, you agree to our Terms & Conditions and you acknowledge that you have read our Privacy Policy.")
        attributedString.addAttribute(.link, value: "https://www.apple.com/legal/internet-services/itunes/", range: (attributedString.string as NSString).range(of: "Terms & Conditions"))
        attributedString.addAttribute(.link, value: "https://www.apple.com/legal/privacy/en-ww/", range: (attributedString.string as NSString).range(of: "Privacy Policy"))
        privacyPolicy.attributedText = attributedString
        privacyPolicy.backgroundColor = .clear
        privacyPolicy.textColor = .label
        privacyPolicy.textAlignment = .center
        privacyPolicy.isSelectable = true
        privacyPolicy.isUserInteractionEnabled = true
        privacyPolicy.isEditable = false
        privacyPolicy.isScrollEnabled = false
        privacyPolicy.linkTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.systemBlue]

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signUpButtonAction(_ sender: UIButton) {
        let registerUserRequest = RegisterUserRequest(username: usernameLabel.text ?? "", email: emailLabel.text ?? "", password: passwordLabel.text ?? "")
        if !Validator.isValidUsername(for: registerUserRequest.username) {
            AlertManager.showInvalidUsernameAlert(on: self)
            return
        }
        if !Validator.isValidEmail(for: registerUserRequest.email) {
            AlertManager.showInvalidEmailAlert(on: self)
            return
        }
        if !Validator.isValidPassword(for: registerUserRequest.password) {
            AlertManager.showInvalidPasswordAlert(on: self)
            return
        }
        
        AuthService.shared.registerUser(with: registerUserRequest) { [weak self] wasRegistered, error in
            guard let self = self else { return }
            if let error = error {
                AlertManager.showRegistrationErrorAlert(on: self, with: error)
                return
            }
            if wasRegistered {
                if let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate {
                    sceneDelegate.checkAuthentication()
                }
            } else {
                AlertManager.showRegistrationErrorAlert(on: self)
            }
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
