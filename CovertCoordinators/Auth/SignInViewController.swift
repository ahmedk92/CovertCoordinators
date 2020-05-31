//
//  SignInViewController.swift
//  CovertCoordinators
//
//  Created by Ahmed Khalaf on 5/31/20.
//  Copyright © 2020 io.github.ahmedkhalaf. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    init(showSignUp: @escaping () -> Void) {
        self.showSignUp = showSignUp
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Sign In"
        view.backgroundColor = .white
        
        let signInButton = UIButton(type: .system)
        signInButton.setTitle("Simulate Sign In", for: .normal)
        signInButton.addTarget(self, action: #selector(signInButtonTapped(_:)), for: .touchUpInside)
        
        let showSignUpButton = UIButton(type: .system)
        showSignUpButton.setTitle("Go to Sign Up", for: .normal)
        showSignUpButton.addTarget(self, action: #selector(showSignUpButtonTapped(_:)), for: .touchUpInside)
        
        let stackView = UIStackView(arrangedSubviews: [
            signInButton,
            showSignUpButton
        ])
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc private func signInButtonTapped(_ sender: Any?) {
        NotificationCenter.default.post(name: AUTHENTICATED_NOTIFICATION_NAME, object: nil)
    }
    
    @objc private func showSignUpButtonTapped(_ sender: Any?) {
        showSignUp()
    }
    
    private let showSignUp: () -> Void
}

let AUTHENTICATED_NOTIFICATION_NAME = NSNotification.Name(rawValue: "AUTHENTICATED")
