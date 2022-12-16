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
        let savedProgressionsTab = SavedProgressionsController()

        progressionTab.tabBarItem.title = L10n.TabBar.Item.progression
        progressionTab.tabBarItem.image = UIImage(systemName: "music.quarternote.3")

        savedProgressionsTab.tabBarItem.title = L10n.TabBar.Item.savedProgressions
        savedProgressionsTab.tabBarItem.image = UIImage(systemName: "music.note.list")

        chordTab.tabBarItem.title = L10n.TabBar.Item.chord
        chordTab.tabBarItem.image = UIImage(systemName: "music.note")

        viewControllers = [progressionTab, savedProgressionsTab, chordTab]

    }

}
