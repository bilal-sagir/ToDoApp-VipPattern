//
//  AppRouter.swift
//  VipToDoApp
//
//  Created by Bilal on 7.02.2022.
//

import Foundation
import UIKit

class AppRouter{
    func start(scene: UIWindowScene) -> UIWindow {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let itemsVC = ItemsBuilder.build()
        let navigationController = UINavigationController(rootViewController: itemsVC)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        window.windowScene = scene
        return window
    }
}
