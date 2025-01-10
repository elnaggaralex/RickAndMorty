//
//  AppCoordinator.swift
//  RickAndMorty
//
//  Created by Mahmoud El-Naggar on 10/01/2025.
//

import UIKit

protocol AppCoordinatorType {
    /// Start the App main screen
    func start()
}

final class AppCoordinator: AppCoordinatorType {
    
    private let window: UIWindow?
    private let navigationController: UINavigationController
    
    init(window: UIWindow?) {
        self.window = window
        navigationController = UINavigationController(rootViewController: UIViewController())
    }
    
    func start() {
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
