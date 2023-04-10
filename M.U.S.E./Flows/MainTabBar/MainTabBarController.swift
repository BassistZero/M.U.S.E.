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
        configure()
        configureAppearance()
    }

    func configure() {
        let songBuilderTab = UINavigationController(rootViewController: SongsViewController())
        let chordTab = ChordViewController()
        let progressionTab = ProgressionViewController()

        songBuilderTab.tabBarItem.title = L10n.MainTabBar.Item.songBuilder
        songBuilderTab.tabBarItem.image = .init(systemName: "briefcase.fill")

        progressionTab.tabBarItem.title = L10n.MainTabBar.Item.progression
        progressionTab.tabBarItem.image = .init(systemName: "music.quarternote.3")

        chordTab.tabBarItem.title = L10n.MainTabBar.Item.chord
        chordTab.tabBarItem.image = .init(systemName: "music.note")

        viewControllers = [songBuilderTab, progressionTab, chordTab]
    }

    func configureAppearance() {
        tabBar.layer.borderWidth = 1
        tabBar.layer.borderColor = UIColor.gray.cgColor
        tabBar.layer.masksToBounds = true
        tabBar.backgroundColor = .init(named: "systemWhite")
    }

}
