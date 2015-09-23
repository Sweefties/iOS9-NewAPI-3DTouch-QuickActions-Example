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
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // set if app launched from shorcut with boolean
        var appLaunchedFromShortCut = false
        // check current shortcut item
        if let currentShorcutItem = launchOptions?[UIApplicationLaunchOptionsShortcutItemKey] as? UIApplicationShortcutItem {
            appLaunchedFromShortCut = true
            QuickActionsForItem(currentShorcutItem)
        }
        // return false if app already launched
        return !appLaunchedFromShortCut
    }

    func applicationWillResignActive(application: UIApplication) {
        //..
    }

    func applicationDidEnterBackground(application: UIApplication) {
        //..
    }

    func applicationWillEnterForeground(application: UIApplication) {
        //..
    }

    func applicationDidBecomeActive(application: UIApplication) {
        //..
    }

    func applicationWillTerminate(application: UIApplication) {
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
    func QuickActionsForItem(shortcutItem: UIApplicationShortcutItem) -> Bool {
        // set handled boolean
        var isHandled = false
        
        // Get the string type from shorcut item
        if let shorchutItemType = QuickActionsType.init(rawValue: shortcutItem.type) {
            
            // Get root navigation controller + root tab bar controller
            let rootNavigationController = window!.rootViewController as? UINavigationController
            let tabbarController = window!.rootViewController as? UITabBarController
            // if needed pop to root view controller
            rootNavigationController?.popToRootViewControllerAnimated(false)
            
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
    func application(application: UIApplication, performActionForShortcutItem shortcutItem: UIApplicationShortcutItem, completionHandler: (Bool) -> Void) {
        // perform action for shortcut item selected
        let handledShortCutItem = QuickActionsForItem(shortcutItem)
        completionHandler(handledShortCutItem)
    }
}
