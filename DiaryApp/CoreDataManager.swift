//
//  CoreDataManager.swift
//  DiaryApp
//
//  Created by Efrain Ayllon on 7/19/16.
//  Copyright © 2016 Efrain Ayllon. All rights reserved.
//

import UIKit
import CoreData

class CoreDataManager: NSObject {
    
    var managedObjectContext :NSManagedObjectContext!
    
    override init() {
        
        guard let url = NSBundle.mainBundle().URLForResource("DiaryAppModel", withExtension: "momd") else {
            fatalError("DiaryApp not found")
        }
        
        guard let managedObjectModel = NSManagedObjectModel(contentsOfURL: url) else {
            fatalError("managed object doesn't exist")
        }
        
        let persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: managedObjectModel)
        
        
        let fileManager = NSFileManager()
        
        
        guard let documentsURL = fileManager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first else {
            fatalError("Directory doesn't exist")
        }
        
//        print(documentsURL)
        
        let storeURL = documentsURL.URLByAppendingPathComponent("DiaryAppDatabase.sqlite")
        
        print(storeURL)
        
        try! persistentStoreCoordinator.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: storeURL, options: nil)
        
        let type = NSManagedObjectContextConcurrencyType.MainQueueConcurrencyType
        self.managedObjectContext = NSManagedObjectContext(concurrencyType: type)
        self.managedObjectContext.persistentStoreCoordinator = persistentStoreCoordinator
        
    }
    
}
  