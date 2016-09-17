![](https://img.shields.io/badge/build-pass-brightgreen.svg?style=flat-square)
![](https://img.shields.io/badge/platform-iOS9+-ff69b4.svg?style=flat-square)
![](https://img.shields.io/badge/Require-XCode7-lightgrey.svg?style=flat-square)


# iOS 9 - New API - 3DTouch - Quick Actions Example
iOS 9~ Experiments - New API Components - Shortcut Quick Action API with 3DTouch.

## Example

![](https://raw.githubusercontent.com/Sweefties/iOS9-NewAPI-3DTouch-QuickActions-Example/master/source/iPhone6S_Simulator2x-3DTouch-QuickActions.jpg)


## Requirements

- >= XCode 7.0
- >= Swift 2.
- >= iOS 9.0.
- >= 3DTouch Devices.

Tested on iOS 9.0 Simulators iPhone 6S, 6S Plus.


## Important

Get the `master` branch for XCode 8 / Swift 3 updated project.


## Configure your app Info Targets


![](https://raw.githubusercontent.com/Sweefties/iOS9-NewAPI-3DTouch-QuickActions-Example/master/source/iPhone6S_Simulator2x-3DTouch-QuickActionsConfig.jpg)


## Usage

To run the example project, download or clone the repo.


### Example Code!


```swift
/// Define quick actions type
enum QuickActionsType: String {
    case First =     "quickactions.domain.first"
    case Second =   "quickactions.domain.second"
    case Third =    "quickactions.domain.third"
}
```

- performActionForShortcutItem example
```swift
/// Calls - user selects a Home screen quick action for app
func application(application: UIApplication, performActionForShortcutItem shortcutItem: UIApplicationShortcutItem, completionHandler: (Bool) -> Void) {
    // perform action for shortcut item selected
    let handledShortCutItem = QuickActionsForItem(shortcutItem)
    completionHandler(handledShortCutItem)
}
```

- didFinishLaunchingWithOptions example
```swift
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
```


- Build and Run!
- Switch to Home screen
- Simulator : [SBShortcutMenuSimulator](https://github.com/DeskConnect/SBShortcutMenuSimulator)
- CAUTION! : make sure to uninstalled it after test!
- Devices : with future iPhone 6s and others 3DTouch devices!
