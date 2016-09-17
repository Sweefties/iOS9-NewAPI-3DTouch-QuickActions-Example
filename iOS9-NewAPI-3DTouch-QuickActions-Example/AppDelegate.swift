//
//  AppDelegate.swift
//  iOS9-NewAPI-3DTouch-QuickActions-Example
//
//  Created by Wlad Dicario on 23/09/2015.
//  Copyright © 2015 Sweefties. All rights reserved.
//

import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    /// Define Home screen static (or dynamic..) quick actions - highly recommanded
    static let applicationShortcutUserInfoIconKey = "applicationShortcutUserInfoIconKey"
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // set if app launched from shorcut with boolean
        var appLaunchedFromShortCut = false
        // check current shortcut item
        if let currentShorcutItem = launchOptions?[UIApplicationLaunchOptionsKey.shortcutItem] as? UIApplicationShortcutItem {
            appLaunchedFromShortCut = true
            QuickActionsForItem(currentShorcutItem)
        }
        // return false if app already launched
        return !appLaunchedFromShortCut
    }

    func applicationWillResignActive(_ application: UIApplication) {
        //..
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        //..
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        //..
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        //..
    }

    func applicationWillTerminate(_ application: UIApplication) {
        //..
    }


}

//MARK: - Handle QuickActions For ShorCut Items -> AppDelegate Extension
typealias HandleForShorCutItem = AppDelegate
extension HandleForShorCutItem {
    
    /// Define quick actions type
    enum QuickActionsType: String {
        case Home =     "quickactions.sweefties.home"
        case Movies =   "quickactions.sweefties.movies"
        case Share =    "quickactions.sweefties.share"
        case Message =  "quickactions.sweefties.message"
    }
    
    /// Shortcut Item, also called a Home screen dynamic quick action, specifies a user-initiated action for app.
    func QuickActionsForItem(_ shortcutItem: UIApplicationShortcutItem) -> Bool {
        // set handled boolean
        var isHandled = false
        
        // Get the string type from shorcut item
        if let shorchutItemType = QuickActionsType.init(rawValue: shortcutItem.type) {
            
            // Get root navigation controller + root tab bar controller
            let rootNavigationController = window!.rootViewController as? UINavigationController
            let tabbarController = window!.rootViewController as? UITabBarController
            // if needed pop to root view controller
            rootNavigationController?.popToRootViewController(animated: false)
            
            // return tabbarcontroller selected
            switch shorchutItemType {
            case .Home:
                tabbarController!.selectedViewController = tabbarController!.viewControllers?[0]
                isHandled = true
            case .Movies:
                tabbarController!.selectedViewController = tabbarController!.viewControllers?[1]
                isHandled = true
            case .Share:
                tabbarController!.selectedViewController = tabbarController!.viewControllers?[2]
                isHandled = true
            case .Message:
                tabbarController!.selectedViewController = tabbarController!.viewControllers?[3]
                isHandled = true
            }
        }
        return isHandled
    }
    
    /// Calls - user selects a Home screen quick action for app
    @objc(application:performActionForShortcutItem:completionHandler:) func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        // perform action for shortcut item selected
        let handledShortCutItem = QuickActionsForItem(shortcutItem)
        completionHandler(handledShortCutItem)
    }
}
