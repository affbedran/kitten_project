//
//  AppDelegate.swift
//  KittenProject
//
//  Created by André Felipe Fleck Bedran on 13/11/19.
//  Copyright © 2019 André Bedran. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // I'm only doing this to avoid implementing a coordinator.
    // Reason: To be honest I worked all day and I'm tired :(
    // If you wish, I can submit a pull request later on, fully implementing the coordinator pattern
    // while predicting future implementation needs such as push notifications and other redirecting options
    // Also, this is here to prevent automatic deallocation of this resource as it is a weak var inside the view layer.
    private(set) lazy var viewModel = GalleryViewModel()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

