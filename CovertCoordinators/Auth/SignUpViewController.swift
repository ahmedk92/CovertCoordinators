//
//  SignUpViewController.swift
//  CovertCoordinators
//
//  Created by Ahmed Khalaf on 5/31/20.
//  Copyright © 2020 io.github.ahmedkhalaf. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Sign Up"
        view.backgroundColor = .white
        
        let signUpButton = UIButton(type: .system)
        signUpButton.setTitle("Simulate Sign Up", for: .normal)
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped(_:)), for: .touchUpInside)
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(signUpButton)
        NSLayoutConstraint.activate([
            signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signUpButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc private func signUpButtonTapped(_ sender: Any?) {
        NotificationCenter.default.post(name: AUTHENTICATED_NOTIFICATION_NAME, object: nil)
    }
}
