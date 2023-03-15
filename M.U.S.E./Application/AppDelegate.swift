import UIKit

@main
final class AppDelegate: UIResponder { }

// MARK: - UIApplicationDelegate

extension AppDelegate: UIApplicationDelegate {

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return .init(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

}
