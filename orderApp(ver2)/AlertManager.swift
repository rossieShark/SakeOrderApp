//
//  AlertManager.swift
//  orderApp(ver2)
//
//  Created by Роза Шархмуллина on 08.05.23.
//

import UIKit

class AlertManager {
    
    private static func showAlert(vc: UIViewController, title: String, message: String?, style: UIAlertController.Style) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: style)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .default))
            vc.present(alert, animated: true)
        }
    }
}

//MARK: Show validation Alerts
extension AlertManager {
    public static func showInvalidEmailAlert(on vc: UIViewController) {
        self.showAlert(vc: vc, title: "Invalid email", message: "Please enter a valid email", style: .alert)
    }
    
    public static func showInvalidPasswordAlert(on vc: UIViewController) {
        self.showAlert(vc: vc, title: "Invalid password", message: "Please enter a valid password", style: .alert)
    }
    
    public static func showInvalidUsernameAlert(on vc: UIViewController) {
        self.showAlert(vc: vc, title: "Invalid username", message: "Please enter a valid username", style: .alert)
    }
    public static func showInvalidNameAlert(on vc: UIViewController) {
        self.showAlert(vc: vc, title: "Invalid name", message: "Please enter a valid name", style: .alert)
    }
    public static func showInvalidPhoneNumber(on vc: UIViewController) {
        self.showAlert(vc: vc, title: "Invalid phone number", message: "Please enter a valid phone number", style: .alert)
    }
}

//MARK: Registration Errors

extension AlertManager {
    public static func showRegistrationErrorAlert(on vc: UIViewController) {
        self.showAlert(vc: vc, title: "Unknown Registration Error", message: nil, style: .alert)
    }
    
    public static func showRegistrationErrorAlert(on vc: UIViewController, with error: Error) {
        self.showAlert(vc: vc, title: "Unknown Registration Error",
                       message: "\(error.localizedDescription)",
                       style: .alert)
    }
}


//MARK: LogIn Errors

extension AlertManager {
    public static func showSigningErrorAlert(on vc: UIViewController) {
        self.showAlert(vc: vc, title: "Unknown Error Signing In", message: nil, style: .alert)
    }
    
    public static func showSigningErrorAlert(on vc: UIViewController, with error: Error) {
        self.showAlert(vc: vc, title: "Error Signing In",
                       message: "\(error.localizedDescription)",
                       style: .alert)
    }
    
}


//MARK: LogOut Errors

extension AlertManager {
    public static func showlogOutErrorAlert(on vc: UIViewController, with error: Error) {
        self.showAlert(vc: vc, title: "Log Out Error",
                       message: "\(error.localizedDescription)",
                       style: .alert)
    }
    
}

//MARK: Forgot Password

extension AlertManager {
    public static func showPasswordResetSent(on vc: UIViewController) {
        self.showAlert(vc: vc, title: "Password Reset Sent", message: nil, style: .alert)
    }
    public static func showErrorSendingPasswordReset(on vc: UIViewController, with error: Error) {
        self.showAlert(vc: vc, title: "Error Sending Password Reset",
                       message: "\(error.localizedDescription)",
                       style: .alert)
    }
    
}


//MARK: Fetching User Errors

extension AlertManager {
    public static func showfetchingUserError(on vc: UIViewController, with error: Error) {
        self.showAlert(vc: vc, title: "Error Fetching User",
                       message: "\(error.localizedDescription)",
                       style: .alert)
    }
    public static func showUnknownFetchingUserError(on vc: UIViewController) {
        self.showAlert(vc: vc, title: "Unknown Fetching User Error", message: nil, style: .alert)
    }
}

