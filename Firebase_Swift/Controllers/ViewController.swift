//
//  ViewController.swift
//  Firebase_Swift
//
//  Created by Dimuth Bandara on 2023-03-07.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - UI Components
    // label (loading)
    private let label: UILabel = {
            let label = UILabel()
            label.textColor = .label
            label.textAlignment = .center
            label.font = .systemFont(ofSize: 24, weight: .semibold)
            label.text = "Loading..."
            label.numberOfLines = 2
            return label
        }()
        
        // MARK: - LifeCycle
        override func viewDidLoad() {
            super.viewDidLoad()
            self.setupUI()
            
            self.label.text = "CodeBrah\ncodebrah@gmail.com"
        }
        
        
        // MARK: - UI Setup
        private func setupUI() {
            // background color
            self.view.backgroundColor = .systemBackground
            
            // UIBar Button Item
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(didTapLogout))
            
            self.view.addSubview(label)
            label.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                label.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            ])
        }
        
        // MARK: - Selectors
        @objc private func didTapLogout() {
            
        }
}

