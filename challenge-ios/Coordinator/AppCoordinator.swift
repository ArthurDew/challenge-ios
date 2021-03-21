//
//  AppCoordinator.swift
//  challenge-ios
//
//  Created by Arthur de Wurstemberger on 21/03/2021.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    func start()
}

class AppCoordinator : Coordinator {
    lazy private var window = UIWindow(frame: UIScreen.main.bounds)
    
    var navigationController = UINavigationController()
    
    func start() {
        self.navigationController.navigationBar.isHidden = true
        self.window.rootViewController = navigationController
        self.window.makeKeyAndVisible()
        
        self.showList()
    }
    
    func showList() {
        let banksViewController = BanksViewController()
        
        let banksViewModel = BanksViewModel()
        banksViewController.viewModel = banksViewModel
        
        self.navigationController.viewControllers = [banksViewController]
    }
}
