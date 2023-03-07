//
//  LoginViewController.swift
//  Firebase_Swift
//
//  Created by Dimuth Bandara on 2023-03-07.
//

// Git commint - CustomTextField added and login field completed

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - UI Components
    private let headerView = AuthHeaderView(title: "Sign In", subTitle: "Sign in to your account")
    
    private let usernameField = CustomTextField(fieldType: .username)
    private let passwordField = CustomTextField(fieldType: .password)
    
    // Define buttons
    
    //
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        
        // setting up buttons
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        self.view.backgroundColor = .systemBackground
        
        self.view.addSubview(headerView)
        self.view.addSubview(usernameField)
        self.view.addSubview(passwordField)
        
        // Add button subviews
        
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        usernameField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.translatesAutoresizingMaskIntoConstraints = false
       
        // Add button contraints

        NSLayoutConstraint.activate([
            self.headerView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor),
            self.headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.headerView.heightAnchor.constraint(equalToConstant: 222),
            
            self.usernameField.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 12),
            self.usernameField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.usernameField.heightAnchor.constraint(equalToConstant: 55),
            self.usernameField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.passwordField.topAnchor.constraint(equalTo: usernameField.bottomAnchor, constant: 22),
            self.passwordField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.passwordField.heightAnchor.constraint(equalToConstant: 55),
            self.passwordField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            
            // button constraints here
        ])
    }
    
    // MARK: - Selectors
    @objc private func didTapSignIn() {
        print("DEBUG PRINT:", "didTapSignIn")
    }
    
    @objc private func didTapNewUser() {
        print("DEBUG PRINT:", "didTapNewUser")
    }
    
    @objc private func didTapForgotPassword() {
        print("DEBUG PRINT:", "didTapForgotPassword")
    }
}
