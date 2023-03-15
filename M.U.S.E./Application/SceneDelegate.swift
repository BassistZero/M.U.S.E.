import UIKit

final class SceneDelegate: UIResponder {

    // MARK: - Public Properties

    var window: UIWindow?

}

// MARK: - UISceneDelegate

extension SceneDelegate: UISceneDelegate {

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        makeWindow(with: windowScene)
    }

}

// MARK: - Configuration

private extension SceneDelegate {

    func makeWindow(with scene: UIWindowScene) {
        window = .init(windowScene: scene)
        window?.rootViewController = MainTabBarController()
        window?.makeKeyAndVisible()
    }

}
