//
//  AppDelegate.swift
//  MoviesJonas
//
//  Created by Jonas Romankiewicz on 21.11.22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions:
                     [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow (frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        window?.rootViewController = UINavigationController(rootViewController: MovieListViewController())
        
        return true
    }

}

