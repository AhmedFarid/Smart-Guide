//
//  AppDelegate.swift
//  Smart Guide
//
//  Created by farid on 3/26/19.
//  Copyright © 2019 farid. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        if let user_token = helper.getAPIToken().userToken{
            if helper.getAPIToken().role == "supervisor" {
                print("user_token\(user_token)")
                let tab = UIStoryboard(name: "supervisor", bundle: nil).instantiateInitialViewController()!
                window?.rootViewController = tab
            }else if helper.getAPIToken().role == "driver" {
                print("user_token\(user_token)")
                let tab = UIStoryboard(name: "driver", bundle: nil).instantiateInitialViewController()!
                window?.rootViewController = tab
            }else if helper.getAPIToken().role == "guide" {
                print("user_token\(user_token)")
                let tab = UIStoryboard(name: "guide", bundle: nil).instantiateInitialViewController()!
                window?.rootViewController = tab
            }else {
                print("user_token\(user_token)")
                let tab = UIStoryboard(name: "member", bundle: nil).instantiateInitialViewController()!
                window?.rootViewController = tab
            }
        }
        
        
        
        IQKeyboardManager.shared.enable = true

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

