//
//  AppDelegate.swift
//  KelvinAssessment
//
//  Created by NEXTAcademy on 12/21/16.
//  Copyright © 2016 NEXTAcademy. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        FIRApp.configure()
        
        if FIRAuth.auth()?.currentUser != nil {
            
            window!.rootViewController = instantiateMatchCandidateViewController()
            FIRAuth.auth()?.addStateDidChangeListener { auth, user in
                if user != nil {
                    return
                } else {
                    let signedOutAlert = UIAlertController.init(title: "Signed Out", message: "You have been signed out from Tinder. Please login again.", preferredStyle: .alert)
                    let okAlertAction = UIAlertAction.init(title: "OK", style: .default, handler: {(alert: UIAlertAction!) in
                        let signedOutNotification = Notification(name: Notification.Name(rawValue: "SignedOutNotification"), object: nil, userInfo: nil)
                        NotificationCenter.default.post(signedOutNotification)
                    })
                    signedOutAlert.addAction(okAlertAction)
                    self.window!.rootViewController?.present(signedOutAlert, animated: true, completion: nil)
                }
            }
            
        } else {
            window!.rootViewController = instantiateLoginViewController()
        }

        observeAuthNotification()
        window!.makeKeyAndVisible()
        
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


extension AppDelegate {
    func observeAuthNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleSignedInNotification(_:)), name: Notification.Name(rawValue: "SignedInNotification") , object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleSignedOutNotification(_:)), name: Notification.Name(rawValue: "SignedOutNotification") , object: nil)
    }
    
//    func observeTransitionNotification() {
//        NotificationCenter.default.addObserver(self, selector: #selector(handleUserTransitionToRecycleGeneralViewController), name: Notification.Name(rawValue: "UserTransitionToRecycleGeneral"), object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(handleUserTransitionToProfileViewController), name: Notification.Name(rawValue: "UserTransitionToProfile"), object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(handleUserTransitionToGuideViewController), name: Notification.Name(rawValue: "UserTransitionToGuide"), object: nil)
//        
//    }
    
    func handleSignedOutNotification(_ notification: Notification) {
        window!.rootViewController = instantiateLoginViewController()
    }
    
    func handleSignedInNotification(_ notification: Notification) {
        window!.rootViewController = instantiateMatchCandidateViewController()
    }
    


    

}

extension AppDelegate {
    
    func instantiateLoginViewController() -> LoginViewController {
        let loginViewController = LoginViewController()
        return loginViewController
    }
    
    func instantiateMatchCandidateViewController() -> UINavigationController {
        let storyboard = UIStoryboard.init(name: "Main", bundle: Bundle.init(identifier: "Main"))
        let matchCandidateViewController = storyboard.instantiateViewController(withIdentifier: "MatchCandidateViewController")
        let navController = UINavigationController(rootViewController: matchCandidateViewController)
        return navController
    }
    
}


