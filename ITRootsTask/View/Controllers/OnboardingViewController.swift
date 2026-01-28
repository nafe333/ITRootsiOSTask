//
//  OnboardingViewController.swift
//  ITRootsTask
//
//  Created by Nafea Elkassas on 27/01/2026.
//

import UIKit

class OnboardingViewController: UIViewController {
    
       //MARK: - Properties
    let onboardingViewModel = OnboardingViewModel()
    let alertManager = AlertManager()
    
       //MARK: - Outlets
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    
    
       //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }


      //MARK: - Behaviour
    
    func setupUI(){
        containerView.layer.cornerRadius = min(containerView.bounds.width, containerView.bounds.height) / 8
        containerView.backgroundColor = UIColor.systemBackground.withAlphaComponent(0.2)
        loginButton.layer.borderWidth = 1
        registerButton.layer.borderWidth = 1
        loginButton.layer.borderColor = UIColor.lightGray.cgColor
        registerButton.layer.borderColor = UIColor.lightGray.cgColor
        loginButton.layer.cornerRadius = min(loginButton.bounds.width, loginButton.bounds.height) / 3
        registerButton.layer.cornerRadius = min(registerButton.bounds.width, registerButton.bounds.height) / 3

    }
    
    func goToHome() {
        UserDefaults.standard.set(true, forKey: "isLoggedIn")

        let tabBarVC = HomeTabBarViewController()

        if let sceneDelegate = UIApplication.shared.connectedScenes
            .first?.delegate as? SceneDelegate {

            sceneDelegate.window?.rootViewController = tabBarVC
            sceneDelegate.window?.makeKeyAndVisible()
        }
    }

    
    
       //MARK: - Actions
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        
        let phone = phoneNumberTextField.text ?? ""
        let password = passwordTextField.text ?? ""

        if let error = onboardingViewModel.validate(phone: phone, password: password) {
            alertManager.showAlert(on: self, title: "Error", message: error)
            return
        }

        let success = onboardingViewModel.login(phone: phone, password: password)

        if success {
            goToHome()
        } else {
            alertManager.showAlert(
                on: self,
                title: "Login Failed",
                message: "Phone number or password is incorrect"
            )
        }
    }
    
    
    @IBAction func registerButtonTapped(_ sender: UIButton) {
        let phone = phoneNumberTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        if let error = onboardingViewModel.validate(phone: phone, password: password) {
            alertManager.showAlert(on: self, title: "Error", message: error)
            return
        }
        
        onboardingViewModel.register(phone: phone, password: password)
        goToHome()
        
    }
   
    @IBAction func switchTapped(_ sender: UISwitch) {
        
        
    }
    
    
}
