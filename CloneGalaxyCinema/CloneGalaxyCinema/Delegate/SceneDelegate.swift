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
//        tabbarController.delegate = self
        window?.rootViewController = tabbarController
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }

}
