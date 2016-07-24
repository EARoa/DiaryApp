//
//  DiaryTableViewController.swift
//  DiaryApp
//
//  Created by Efrain Ayllon on 7/19/16.
//  Copyright © 2016 Efrain Ayllon. All rights reserved.
//

import UIKit
import CoreData

class DiaryTableViewController: UITableViewController,NSFetchedResultsControllerDelegate, AddNewEntryDelegate {
    
    var managedObjectContext :NSManagedObjectContext!
    var fetchedResultsController :NSFetchedResultsController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fetchRequest = NSFetchRequest(entityName: "DiaryEntries")
        
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "details", ascending: true)]
        
        self.fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: self.managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
        
        self.fetchedResultsController.delegate = self
        
        try! self.fetchedResultsController.performFetch()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let addEntryController = segue.destinationViewController as? AddEntryViewController
        addEntryController!.delegate = self
        
    }
    
    
    
    func newEntryWasAdded(title: String!, details: String!) {
        
        let diaryEntry = NSEntityDescription.insertNewObjectForEntityForName("DiaryEntries", inManagedObjectContext: self.managedObjectContext)
    
        diaryEntry.setValue(title, forKey: "title")
        diaryEntry.setValue(details, forKey: "details")
        
        try! self.managedObjectContext.save()
        
    }
    
    
    
    
    func controller(controller: NSFetchedResultsController, didChangeObject anObject: AnyObject, atIndexPath indexPath: NSIndexPath?, forChangeType type: NSFetchedResultsChangeType, newIndexPath: NSIndexPath?) {
        
        switch(type) {
        case .Insert:
            self.tableView.insertRowsAtIndexPaths([newIndexPath!], withRowAnimation: .Automatic)
            break
            
        case .Delete:
            break
            
        case .Update:
            break
            
        case .Move:
            break
            
        }
    }
    

    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let entries = self.fetchedResultsController.sections else {
            fatalError("Featched Results Error")
        }
        return entries[section].numberOfObjects
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        let diarylist = self.fetchedResultsController.objectAtIndexPath(indexPath)
        cell.textLabel?.text = diarylist.valueForKey("title") as? String
        print()
        cell.detailTextLabel?.text = diarylist.valueForKey("details") as? String
        print()

        return cell
}
    
    
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        
        if editingStyle == .Delete {
            
            let deletePosts: NSManagedObject = self.fetchedResultsController.objectAtIndexPath(indexPath) as! NSManagedObject
            
            self.managedObjectContext.deleteObject(deletePosts)
            
            try! self.managedObjectContext.save()
            
            self.tableView.reloadData()
        }
    }

    
    

}