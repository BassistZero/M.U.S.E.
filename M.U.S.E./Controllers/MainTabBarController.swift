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
        let firstTab = ChordViewController()
        let secondTab = ProgressionViewController()

        firstTab.tabBarItem.title = "Chord"
        firstTab.tabBarItem.image = UIImage(systemName: "music.note")

        secondTab.tabBarItem.title = "Progression"
        secondTab.tabBarItem.image = UIImage(systemName: "music.quarternote.3")

        viewControllers = [firstTab, secondTab]

    }

}
