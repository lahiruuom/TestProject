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

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }
    
    fileprivate func setupIQKeyboardManager() {
        IQKeyboardManager.shared.enable = true
    }

}

