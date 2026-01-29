//
//  Validator.swift
//  ITRootsTask
//
//  Created by Nafea Elkassas on 27/01/2026.
//

import Foundation

class Validator {
    
       //MARK: - Behaviour
    func isValidPhone(phoneNumber: String) -> Bool {
        phoneNumber.count == 11
    }

    func isValidPassword(_ password: String) -> Bool {
        let regex = "^[A-Za-z0-9]{6,}$"
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: password)
    }
    

    
    func isValidEmail(_ email: String) -> Bool {
        let regex = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: email)
    }
    
    func isValidName(_ name: String) -> Bool {
        let regex = "^[A-Za-z]{2,}$"
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: name)
    }


}
