//
//  LoginViewController.swift
//  orderApp(ver2)
//
//  Created by Роза Шархмуллина on 08.05.23.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailFieldLabel: UITextField!
    @IBOutlet weak var passwordFieldLabel: UITextField!
    @IBOutlet weak var signInButtonLabel: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       

        // Do any additional setup after loading the view.
    }
    
    
    
    
    @IBAction func signInButton(_ sender: UIButton) {
        let loginRequest = LoginUserRequest(email: emailFieldLabel.text ?? "", password: passwordFieldLabel.text ?? "")
        
        if !Validator.isValidEmail(for: loginRequest.email) {
            AlertManager.showInvalidEmailAlert(on: self)
            return
        }
        
        // Password check
        if !Validator.isValidPassword(for: loginRequest.password) {
            AlertManager.showInvalidPasswordAlert(on: self)
            return
        }
        AuthService.shared.signIn(with: loginRequest) { [weak self] error in
            guard let self = self else { return }
            if let error = error {
                AlertManager.showSigningErrorAlert(on: self, with: error)
                return
            }
            if let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate {
                sceneDelegate.checkAuthentication()
            } else {
                AlertManager.showSigningErrorAlert(on: self)
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
    
    @IBAction func unwindSegueToMainScreen(segue: UIStoryboardSegue) {
        guard segue.identifier == "goToMainPage" else { return }
    }
}
