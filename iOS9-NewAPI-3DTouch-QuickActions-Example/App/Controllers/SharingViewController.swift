//
//  SharingViewController.swift
//  iOS9-NewAPI-3DTouch-QuickActions-Example
//
//  Created by Wlad Dicario on 23/09/2015.
//  Copyright © 2015 Sweefties. All rights reserved.
//

import UIKit

class SharingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /// load ShareView
    @IBAction func ShareView(sender: UIButton) {
        print("Button Share View was pressed")
        // define constants, array and add objects
        let text = "Fun 3DTouch Quick Action API!"
        let url = NSURL(string: "https://www.apple.com/")
        let itemsToShare: NSMutableArray = []
        itemsToShare.addObject(text)
        itemsToShare.addObject(url!)
        
        // Prepare ActivityController
        let activityController = UIActivityViewController(activityItems: itemsToShare as [AnyObject], applicationActivities:nil)
        
        presentViewController(activityController, animated: true, completion: nil)
        if activityController.respondsToSelector("popoverPresentationController") {
            // iOS 8 and later
            let presentationController = activityController.popoverPresentationController
            let v = sender as UIView
            presentationController?.sourceView = v
            presentationController?.sourceRect = v.bounds
        }
    }
    
}
