//
//  SceneDelegate.swift
//  RxSwiftMVVM
//
//  Created by 정수현 on 2020/11/28.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    // coordinator
    var appCoordinator: AppCoordinator?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        //scene
        guard let scene = (scene as? UIWindowScene) else { return }
        //window from the scene
        let window = UIWindow(windowScene: scene)
        // coordinator
        appCoordinator = AppCoordinator(window: window)
        appCoordinator?.start()
         
    }

}

