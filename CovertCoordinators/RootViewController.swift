//
//  RootViewController.swift
//  CovertCoordinators
//
//  Created by Ahmed Khalaf on 5/31/20.
//  Copyright © 2020 io.github.ahmedkhalaf. All rights reserved.
//

import UIKit

class RootViewController: UINavigationController {
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewControllers([
            DashboardViewController { [weak self] in
                self?.pushViewController(SettingsViewController { [weak self] in
                    self?.popViewController(animated: true)
                }, animated: true)
            }
        ], animated: false)
        
        if shouldAuthenticate {
            viewDidAppearQueue.append {
                let authVC = AuthViewController()
                self.authViewController = authVC
                authVC.isModalInPresentation = true
                self.present(authVC, animated: true)
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidLoad()
        while !viewDidAppearQueue.isEmpty {
            viewDidAppearQueue.removeFirst()()
        }
        
        NotificationCenter.default.addObserver(forName: AUTHENTICATED_NOTIFICATION_NAME, object: nil, queue: nil) { [weak self] (_) in
            self?.authViewController?.dismiss(animated: true)
        }
    }
    
    private var viewDidAppearQueue: [() -> Void] = []
    private weak var authViewController: AuthViewController?
}

private let shouldAuthenticate = true
