import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        makeWindow()
        return true
    }

}

// MARK: - Private Methods

private extension AppDelegate {

    func makeWindow() {
        let tabBar = MainTabBarController()

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = tabBar
        window?.makeKeyAndVisible()
    }

}
