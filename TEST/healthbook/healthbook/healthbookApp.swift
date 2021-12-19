//
//  healthbookApp.swift
//  healthbook
//
//  Created by Matthieu Oliviers on 08/Oct/2021.
//


import UIKit
import FirebaseCore

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate{
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey:Any]?) -> Bool {
        // Override point for customization after applicaiton launch

            FirebaseApp.configure()

        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        //
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        //
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        //
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        //
    }

    func applicationWillTerminate(_ application: UIApplication) {
        //
    }
    
}

//import SwiftUI

//@main
//struct healthbookApp: App {
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//        }
//    }
//}


