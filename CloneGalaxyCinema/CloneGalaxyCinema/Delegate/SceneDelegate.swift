//
//  SceneDelegate.swift
//  CloneGalaxyCinema
//
//  Created by Toan Tran on 11/11/2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let tabbarController = UITabBarController()
        let homeVC = HomeViewController()
        let navigation = UINavigationController(rootViewController: homeVC)
        navigation.isNavigationBarHidden = true
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        // Messages
        let cinemaVC = CinemaViewController()
        let cinemaNavi = UINavigationController(rootViewController: cinemaVC)
        cinemaVC.tabBarItem = UITabBarItem(title: "Theater", image: UIImage(systemName: "eyeglasses"), tag: 1)
        // Friends
        let movieVC = MovieBlogViewController()
        let movieNavi = UINavigationController(rootViewController: movieVC)
        movieVC.tabBarItem = UITabBarItem(title: "Movie Blog", image: UIImage(systemName: "camera"), tag: 2)
        // Profile
        let profileVC = AccountViewController()
        let profileNavi = UINavigationController(rootViewController: profileVC)
        profileVC.tabBarItem = UITabBarItem(title: "Account", image: UIImage(systemName: "house"), tag: 3)
        tabbarController.viewControllers = [navigation, cinemaNavi, movieNavi, profileNavi]
        tabbarController.tabBar.backgroundColor = .white

        window?.rootViewController = tabbarController
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later,
//        as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
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
