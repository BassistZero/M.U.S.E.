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
        let chordTab = ChordViewController()
        let progressionTab = ProgressionViewController()

        progressionTab.tabBarItem.title = L10n.TabBar.Item.progression
        progressionTab.tabBarItem.image = UIImage(systemName: "music.quarternote.3")

        chordTab.tabBarItem.title = L10n.TabBar.Item.chord
        chordTab.tabBarItem.image = UIImage(systemName: "music.note")

        viewControllers = [progressionTab, chordTab]

    }

}
