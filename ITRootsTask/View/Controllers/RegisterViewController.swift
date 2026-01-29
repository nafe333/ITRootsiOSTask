//
//  RegisterViewController.swift
//  ITRootsTask
//
//  Created by Nafea Elkassas on 29/01/2026.
//

import UIKit
import MOLH

class RegisterViewController: UIViewController {
    
       //MARK: - Properties
    let viewModel = RegisterViewModel()
    let alertManager = AlertManager()
    
       //MARK: - Outlets
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    

       //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupLocalizations()
        
    }

       //MARK: - Behaviour
    func setupUI(){
        containerView.layer.cornerRadius = min(containerView.bounds.width, containerView.bounds.height) / 8
        containerView.backgroundColor = UIColor.systemBackground.withAlphaComponent(0.2)
        registerButton.layer.borderWidth = 1
        registerButton.layer.borderColor = UIColor.lightGray.cgColor
        registerButton.layer.cornerRadius = min(registerButton.bounds.width, registerButton.bounds.height) / 3

    }
    func setupLocalizations(){
        registerButton.setTitle(NSLocalizedString("registerButtonTitle", comment: ""), for: .normal)
        fullNameTextField.placeholder = NSLocalizedString("fullNamePlaceholder", comment: "")
        phoneTextField.placeholder = NSLocalizedString("phoneNumberPlaceholder", comment: "")
        emailTextField.placeholder = NSLocalizedString("emailPlaceholder", comment: "")
        passwordTextField.placeholder = NSLocalizedString("passwordPlaceholder", comment: "")
    }
    
    func goToHome() {
        MOLH.reset()
    }
    
       //MARK: - Actions
    
    @IBAction func registerButtonTapped(_ sender: UIButton) {
        let user = User(
            fullName: fullNameTextField.text ?? "",
            email: emailTextField.text ?? "",
            phone: phoneTextField.text ?? "",
            password: passwordTextField.text ?? ""
        )
        
        if let error = viewModel.validate(user: user) {
            alertManager.showAlert(on: self, title: "Error", message: error)
            return
        }
        
        viewModel.register(user: user)
        goToHome()
        
    }
    
}

