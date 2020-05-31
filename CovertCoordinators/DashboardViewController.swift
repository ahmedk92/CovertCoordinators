//
//  DashboardViewController.swift
//  CovertCoordinators
//
//  Created by Ahmed Khalaf on 5/31/20.
//  Copyright © 2020 io.github.ahmedkhalaf. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {
    init(showSettings: @escaping () -> Void) {
        self.showSettings = showSettings
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Dashboard"
        view.backgroundColor = .white
        
        let showSettingsButton = UIButton(type: .system)
        showSettingsButton.setTitle("Settings", for: .normal)
        showSettingsButton.addTarget(self, action: #selector(showSettingsButtonTapped(_:)), for: .touchUpInside)
        showSettingsButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(showSettingsButton)
        NSLayoutConstraint.activate([
            showSettingsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            showSettingsButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc private func showSettingsButtonTapped(_ sender: Any?) {
        showSettings()
    }
    
    private let showSettings: () -> Void
}
