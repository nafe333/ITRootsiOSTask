//
//  AppLanguage.swift
//  ITRootsTask
//
//  Created by Nafea Elkassas on 28/01/2026.
//

import Foundation
enum AppLanguage: String {
    case english = "en"
    case arabic = "ar"

    static var current: AppLanguage {
        let lang = UserDefaults.standard.array(forKey: "AppleLanguages")?.first as? String ?? "en"
        return lang.starts(with: "ar") ? .arabic : .english
    }
}
