//
//  AppCoordinator.swift
//  RickAndMorty
//
//  Created by Mahmoud El-Naggar on 10/01/2025.
//

import UIKit

protocol AppCoordinatorType {
    /// Start the App main flow
    func start()
}

final class AppCoordinator: AppCoordinatorType {
    
    private let window: UIWindow?
    private let navigationController: UINavigationController
    
    init(window: UIWindow?) {
        self.window = window
        navigationController =  UINavigationController()
    }
    
    func start() {
        navigationController.viewControllers = [CharactersViewController(viewModel: CharactersViewModel(coordinator: self, repository: CharactersRepository(networkService: NetworkService())))]
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
