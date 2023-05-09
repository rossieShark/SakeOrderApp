//
//  ForgotPasswordViewController.swift
//  orderApp(ver2)
//
//  Created by Роза Шархмуллина on 08.05.23.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    @IBOutlet weak var emailFieldLabel: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func forgotPasswordAction(_ sender: Any) {
        let email = self.emailFieldLabel.text ?? ""
        if !Validator.isValidEmail(for: email) {
            AlertManager.showInvalidEmailAlert(on: self)
            return
        }
        AuthService.shared.forgotPassword(with: email) { [weak self] error in
            guard let self = self else { return }
            if let error = error {
                AlertManager.showErrorSendingPasswordReset(on: self, with: error)
                return
            }
            AlertManager.showPasswordResetSent(on: self)
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
