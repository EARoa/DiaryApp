//
//  AddEntryViewController.swift
//  DiaryApp
//
//  Created by Efrain Ayllon on 7/19/16.
//  Copyright © 2016 Efrain Ayllon. All rights reserved.
//

import UIKit
import CoreData


protocol AddNewEntryDelegate {
    func newEntryWasAdded(title: String!, details: String!)
}


class AddEntryViewController: UIViewController {
    
    var managedObjectContext :NSManagedObjectContext!
    var diaryPosts :NSManagedObject!
    
    var delegate: AddNewEntryDelegate!


    @IBOutlet weak var entryTitleTextField: UITextField!
    @IBOutlet weak var entryDetailsTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func close() {
        self.dismissViewControllerAnimated(true, completion: {})
    }
    
    @IBAction func addButtonPressed() {
        self.dismissViewControllerAnimated(true, completion: {})
        self.delegate.newEntryWasAdded(self.entryTitleTextField.text, details: entryDetailsTextView.text)
    }
    
}

