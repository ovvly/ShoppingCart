import UIKit

@UIApplicationMain
private class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var controllersFactory = ControllersFactory()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = controllersFactory.createProductListViewController()
        window?.makeKeyAndVisible()

        return true
    }
}

