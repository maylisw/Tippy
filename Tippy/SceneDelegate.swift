//
//  SceneDelegate.swift
//  Tippy
//
//  Created by Maÿlis Whetsel on 7/14/20.
//  Copyright © 2020 Maÿlis Whetsel. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    @IBOutlet weak var billField: UITextField!
    var backgroundTime: NSDate = NSDate.init()
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        let timeNow = NSDate.init()
        
        if (Int(timeNow.timeIntervalSince(backgroundTime as Date)) >= 600) { // 600 seconds = 10 mi
            // past 10 min, reset value to zero
            let defaults = UserDefaults.standard
            defaults.synchronize()
        }

    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
        let timeNow = NSDate.init()
        
        if (Int(timeNow.timeIntervalSince(backgroundTime as Date)) >= 600) { // 600 seconds = 10 mi
            // past 10 min, reset value to zero
            let defaults = UserDefaults.standard
            defaults.synchronize()
        }
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        backgroundTime = NSDate.init()
    }


}

