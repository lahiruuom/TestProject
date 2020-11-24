//
//  AppDelegate.swift
//  TestProject
//
//  Created by Lahiru Munasinghe on 11/24/20.
//

import UIKit
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: Properties
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupIQKeyboardManager()
        pushToViewController()
        return true
    }

}

// MARK: - Fileprivate Methods
extension AppDelegate {
    
    fileprivate func pushToViewController() {
        let vc = ViewController.create(viewModel: ViewModel())
        let navigationController =  UINavigationController(rootViewController: vc)
        navigationController.modalPresentationStyle = .fullScreen
        navigationController.setNavigationBarHidden(true, animated: false)
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
    }
    
    fileprivate func setupIQKeyboardManager() {
        IQKeyboardManager.shared.enable = true
    }
    
}

