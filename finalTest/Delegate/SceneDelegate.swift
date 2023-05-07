//
//  SceneDelegate.swift
//  finalTest
//
//  Created by MacBook Pro on 6/5/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        
//        let tabOne = ViewController()
//        let navOne = UINavigationController(rootViewController: tabOne)
//        let houseImage = UIImageView()
//        houseImage.image = UIImage(systemName: "house.fill")
//        houseImage.tintColor = #colorLiteral(red: 1, green: 0.6588235294, blue: 0, alpha: 1)
//        let BarItemOne = UITabBarItem(title: "Home",
//                                      image: UIImage(systemName: "house.fill"),
//                                      selectedImage: UIImage(systemName: "house.fill"))
//        tabOne.tabBarItem = BarItemOne
//
//        let tabTwo = FavoriteViewController()
//        let heartImage = UIImageView()
//        heartImage.image = UIImage(systemName: "heart.fill")
//        heartImage.tintColor = #colorLiteral(red: 1, green: 0.6588235294, blue: 0, alpha: 1)
//        let BarItemTwo = UITabBarItem(title: "Favorite",
//                                      image: UIImage(systemName: "heart.fill"),
//                                      selectedImage: heartImage.image)
//        tabTwo.tabBarItem = BarItemTwo
//
//        let tabThree = FavoriteViewController()
//        let cartImage = UIImageView()
//        cartImage.image = UIImage(systemName: "cart.fill")
//        cartImage.tintColor = #colorLiteral(red: 1, green: 0.6588235294, blue: 0, alpha: 1)
//        let BarItemThree = UITabBarItem(title: "Cart",
//                                        image: UIImage(systemName: "cart.fill"),
//                                        selectedImage: cartImage.image)
//        tabThree.tabBarItem = BarItemThree
//
//        let tabFour = FavoriteViewController()
//        let listImage = UIImageView()
//        listImage.image = UIImage(systemName: "list.clipboard")
//        listImage.tintColor = #colorLiteral(red: 1, green: 0.6588235294, blue: 0, alpha: 1)
//        let BarItemFour = UITabBarItem(title: "My orders",
//                                       image: UIImage(systemName: "list.clipboard"),
//                                       selectedImage: listImage.image)
//        tabFour.tabBarItem = BarItemFour
//
//        let navBar = UITabBarController()
//        navBar.viewControllers = [navOne, tabTwo, tabThree, tabFour]
//        navBar.tabBar.tintColor = #colorLiteral(red: 0.7176470588, green: 0.7176470588, blue: 0.7176470588, alpha: 1)
//        //navBar.tabBar.backgroundColor = #colorLiteral(red: 0.2039215686, green: 0.2039215686, blue: 0.2039215686, alpha: 1)
        
        window.rootViewController = MainTabBarController()
        self.window = window
        window.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

