//
//  AuthViewController.swift
//  CovertCoordinators
//
//  Created by Ahmed Khalaf on 5/31/20.
//  Copyright © 2020 io.github.ahmedkhalaf. All rights reserved.
//

import UIKit

class AuthViewController: UINavigationController {
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewControllers([
            SignInViewController { [weak self] in
                self?.pushViewController(SignUpViewController(), animated: true)
            }
        ], animated: false)
    }
}
