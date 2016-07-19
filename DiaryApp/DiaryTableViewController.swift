//
//  DiaryTableViewController.swift
//  DiaryApp
//
//  Created by Efrain Ayllon on 7/19/16.
//  Copyright © 2016 Efrain Ayllon. All rights reserved.
//

import UIKit
import CoreData

class DiaryTableViewController: UITableViewController,NSFetchedResultsControllerDelegate {

    
    var managedObjectContext :NSManagedObjectContext!

    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
}
