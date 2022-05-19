//
//  TabBarController.swift
//  M.U.S.E.
//
//  Created by Bassist_Zero on 5/19/22.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialState()
    }

}

// MARK: - Configuration

private extension MainTabBarController {

    func setupInitialState() {
        viewControllers = [ChordViewController()]
    }

}
