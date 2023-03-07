

import UIKit

class RegisterViewController: UIViewController {
    
    // MARK: - UI Components
        
    // header View
    private let headerView = AuthHeaderView(title: "Sign Up", subTitle: "Create your account")
        
        // name fields
        private let usernameField = CustomTextField(fieldType: .username)
        private let emailField = CustomTextField(fieldType: .email)
        private let passwordField = CustomTextField(fieldType: .password)
        
        // Buttons
        private let signUpButton = CustomButton(title: "Sign Up", hasBackground: true, fontSize: .big)
        private let signInButton = CustomButton(title: "Already have an account? Sign In.", fontSize: .med)
        
        // Terms and conditions (Google Sign In)
        private let termsTextView: UITextView = {
            let attributedString = NSMutableAttributedString(string: "By creating an account, you agree to our Terms & Conditions and you acknowledge that you have read our Privacy Policy.")
            
            attributedString.addAttribute(.link, value: "terms://termsAndConditions", range: (attributedString.string as NSString).range(of: "Terms & Conditions"))
            
            attributedString.addAttribute(.link, value: "privacy://privacyPolicy", range: (attributedString.string as NSString).range(of: "Privacy Policy"))
            
            let tv = UITextView()
            
            // Adding Attributes
            attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 17), range: (attributedString.string as NSString).range(of: "By creating an account, you agree to our Terms & Conditions and you acknowledge that you have read our Privacy Policy."))
            tv.linkTextAttributes = [.foregroundColor: UIColor.systemBlue]
            tv.backgroundColor = .clear
            tv.attributedText = attributedString
            tv.textColor = .label
            tv.isSelectable = true
            tv.isEditable = false
            tv.delaysContentTouches = false
            tv.isScrollEnabled = false
            
            return tv
        }()
        
        // MARK: - LifeCycle
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Setting up UI
            self.setupUI()
            
            // Terms and Conditions
            self.termsTextView.delegate = self
            
            // Sign Up and Sign In Buttons
            self.signUpButton.addTarget(self, action: #selector(didTapSignUp), for: .touchUpInside)
            self.signInButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
        }
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            self.navigationController?.navigationBar.isHidden = true
        }
        
        // MARK: - UI Setup
        private func setupUI() {
            self.view.backgroundColor = .systemBackground
            
            // Adding Sub Views
            self.view.addSubview(headerView)
            self.view.addSubview(usernameField)
            self.view.addSubview(emailField)
            self.view.addSubview(passwordField)
            self.view.addSubview(signUpButton)
            self.view.addSubview(termsTextView)
            self.view.addSubview(signInButton)
            
            // Defining translatesAutoresizingMaskIntoConstraints
            self.headerView.translatesAutoresizingMaskIntoConstraints = false
            self.usernameField.translatesAutoresizingMaskIntoConstraints = false
            self.emailField.translatesAutoresizingMaskIntoConstraints = false
            self.passwordField.translatesAutoresizingMaskIntoConstraints = false
            self.signUpButton.translatesAutoresizingMaskIntoConstraints = false
            self.termsTextView.translatesAutoresizingMaskIntoConstraints = false
            self.signInButton.translatesAutoresizingMaskIntoConstraints = false

            // Adding constraints
            NSLayoutConstraint.activate([
                // Constraints of header View
                self.headerView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor),
                self.headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                self.headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                self.headerView.heightAnchor.constraint(equalToConstant: 222),
                
                // Constraints of username field
                self.usernameField.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 12),
                self.usernameField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
                self.usernameField.heightAnchor.constraint(equalToConstant: 55),
                self.usernameField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
                
                // constraints of email field
                self.emailField.topAnchor.constraint(equalTo: usernameField.bottomAnchor, constant: 22),
                self.emailField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
                self.emailField.heightAnchor.constraint(equalToConstant: 55),
                self.emailField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
                
                // constraints of password field
                self.passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 22),
                self.passwordField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
                self.passwordField.heightAnchor.constraint(equalToConstant: 55),
                self.passwordField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
                
                // Constraints of sign up button
                self.signUpButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 22),
                self.signUpButton.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
                self.signUpButton.heightAnchor.constraint(equalToConstant: 55),
                self.signUpButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
                
                // Constraints of terms and conditions
                self.termsTextView.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 6),
                self.termsTextView.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
                self.termsTextView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
                
                // constraints of sign In Button
                self.signInButton.topAnchor.constraint(equalTo: termsTextView.bottomAnchor, constant: 11),
                self.signInButton.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
                self.signInButton.heightAnchor.constraint(equalToConstant: 44),
                self.signInButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            ])
        }
        
        // MARK: - Selectors
        
        @objc func didTapSignUp() {
            print("DEBUG PRINT:", "didTapSignUp")
        }
        
        @objc private func didTapSignIn() {
            self.navigationController?.popToRootViewController(animated: true)
        }
        
    }

    extension RegisterViewController: UITextViewDelegate {
        
        
        func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
            // Adding google policies (terms and privacy)
            if URL.scheme == "terms" {
                self.showWebViewerController(with: "https://policies.google.com/terms?hl=en")
            } else if URL.scheme == "privacy" {
                self.showWebViewerController(with: "https://policies.google.com/privacy?hl=en")
            }
            
            return true
        }
        
        // Opening Web Viewer
        private func showWebViewerController(with urlString: String) {
            let vc = WebViewController(with: urlString)
            let nav = UINavigationController(rootViewController: vc)
            self.present(nav, animated: true, completion: nil)
        }
        
        // changing the text
        func textViewDidChangeSelection(_ textView: UITextView) {
            textView.delegate = nil
            textView.selectedTextRange = nil
            textView.delegate = self
        }
   
}
