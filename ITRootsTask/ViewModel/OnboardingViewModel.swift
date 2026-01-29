//
//  OnboardingViewModel.swift
//  ITRootsTask
//
//  Created by Nafea Elkassas on 27/01/2026.
//

import Foundation
class OnboardingViewModel {
    
    init(validator: Validator = Validator()) {
        self.validator = validator
    }
    
       //MARK: - Properties
    enum Action {
        case login
        case register
    }
    private let defaults = UserDefaults.standard
    private let validator: Validator
    
       //MARK: - Behaviour
    func validate(phone: String, password: String) -> String? {

        guard validator.isValidPhone(phoneNumber: phone) else {
            return "Invalid phone number"
        }

        guard validator.isValidPassword(password) else {
            return "Weak password"
        }

        return nil
    }

    
    func login(phone: String, password: String) -> Bool {
            let savedPhone = defaults.string(forKey: UserDefaultsKeys.phone)
            let savedPassword = defaults.string(forKey: UserDefaultsKeys.password)

            guard phone == savedPhone, password == savedPassword else {
                return false
            }

            defaults.set(true, forKey: UserDefaultsKeys.isLoggedIn)
            return true
        }
    
    
}
