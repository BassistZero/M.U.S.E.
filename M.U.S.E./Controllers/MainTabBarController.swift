import UIKit

final class MainTabBarController: UITabBarController {

    // MARK: - UIViewController

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

        firstTab.tabBarItem.title = L10n.TabBar.Item.chord
        firstTab.tabBarItem.image = UIImage(systemName: "music.note")

        secondTab.tabBarItem.title = L10n.TabBar.Item.progression
        secondTab.tabBarItem.image = UIImage(systemName: "music.quarternote.3")

        viewControllers = [firstTab, secondTab]

    }

}
