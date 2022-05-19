import UIKit

final class MainTabBarController: UITabBarController {

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
