//
//  MoviesTableViewController.swift
//  iOS9-NewAPI-3DTouch-QuickActions-Example
//
//  Created by Wlad Dicario on 23/09/2015.
//  Copyright © 2015 Sweefties. All rights reserved.
//

import UIKit

class MoviesTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath)
        // Configure the cell...
        cell.textLabel?.text = "Video Title \((indexPath as NSIndexPath).row)"
        cell.detailTextLabel?.text = "\((indexPath as NSIndexPath).row)"
        
        return cell
    }
    
}
