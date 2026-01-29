//
//  RegisterViewModel.swift
//  ITRootsTask
//
//  Created by Nafea Elkassas on 29/01/2026.
//

import Foundation
class RegisterViewModel {
    private let validator: Validator
    private let defaults = UserDefaults.standard

    init(validator: Validator = Validator()) {
        self.validator = validator
    }
    
    func validate(user: User) -> String? {

        guard validator.isValidName(user.fullName) else {
            return "Please enter a valid full name"
        }

        guard validator.isValidEmail(user.email) else {
            return "Invalid email address"
        }

        guard validator.isValidPhone(phoneNumber: user.phone) else {
            return "Invalid phone number"
        }

        guard validator.isValidPassword(user.password) else {
            return "Password must be at least 6 characters with no symbols"
        }

        return nil
    }
    
    func register(user: User) {
        defaults.set(user.fullName, forKey: UserDefaultsKeys.fullName)
        defaults.set(user.email, forKey: UserDefaultsKeys.email)
        defaults.set(user.phone, forKey: UserDefaultsKeys.phone)
        defaults.set(user.password, forKey: UserDefaultsKeys.password)
        defaults.set(true, forKey: UserDefaultsKeys.isLoggedIn)
    }

}
