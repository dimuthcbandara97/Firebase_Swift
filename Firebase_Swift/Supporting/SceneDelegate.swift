//
//  SceneDelegate.swift
//  Firebase_Swift
//
//  Created by Dimuth Bandara on 2023-03-07.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
                let window = UIWindow(windowScene: windowScene)
                
                let vc = LoginViewController()
                let nav = UINavigationController(rootViewController: vc)
                nav.modalPresentationStyle = .fullScreen
                
                window.rootViewController = nav
                self.window = window
                self.window?.makeKeyAndVisible()
        
        // use ViewController instead of HomeViewController to minimize errors
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

