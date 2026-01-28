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

    func isValidPassword(password: String) -> Bool {
        password.count > 6
    }
    
    func isDataValid(phoneNumber: String, password: String) -> Bool {
     isValidPhone(phoneNumber: phoneNumber) && isValidPassword(password: password)
    }

}
