//
//  OnboardingViewController.swift
//  ITRootsTask
//
//  Created by Nafea Elkassas on 27/01/2026.
//

import UIKit

class OnboardingViewController: UIViewController {
    
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
        containerView.layer.cornerRadius = min(containerView.bounds.width, containerView.bounds.height) / 4
        containerView.backgroundColor = UIColor.systemBackground.withAlphaComponent(0.2)
    }

}
