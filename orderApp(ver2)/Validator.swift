//
//  Validator.swift
//  orderApp(ver2)
//
//  Created by Роза Шархмуллина on 08.05.23.
//

import Foundation


class Validator {
    
    
    static func isValidEmail(for email: String) -> Bool {
        let email = email.trimmingCharacters(in: .whitespacesAndNewlines)
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.{1}[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        
        return emailPred.evaluate(with: email)
    }
    
    static func isValidUsername(for username: String) -> Bool {
        let username = username.trimmingCharacters(in: .whitespacesAndNewlines)
        let usernameRegEx = "\\w{4,24}"
        let usernamePred = NSPredicate(format: "SELF MATCHES %@", usernameRegEx)
        
        return usernamePred.evaluate(with: username)
    }
    
    static func isValidPassword(for password: String) -> Bool {
        let password = password.trimmingCharacters(in: .whitespacesAndNewlines)
        let passwordRegEx = "^(?=.*[a-z])(?=.*[$@$#!%*?&]).{6,32}$"
        let passwordPred = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        
        return passwordPred.evaluate(with: password)
    }
    
    static func isValidName(for name: String) -> Bool {
        let name = name.trimmingCharacters(in: .whitespacesAndNewlines)
        let nameRegEx = "^([А-Я]{1}[а-яё]{1,23}|[A-Z]{1}[a-z]{1,23})$"
        let namePred = NSPredicate(format: "SELF MATCHES %@", nameRegEx)
        
        return namePred.evaluate(with: name)
    }
    static func isValidnumber(for number: String) -> Bool {
        let number = number.trimmingCharacters(in: .whitespacesAndNewlines)
        let numberRegEx = "^(+7|7|8)+([0-9]){10})$"
        let numberPred = NSPredicate(format: "SELF MATCHES %@", numberRegEx)
        
        return numberPred.evaluate(with: number)
    }
    
}
