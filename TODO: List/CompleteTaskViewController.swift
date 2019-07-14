//
//  CompleteTaskViewController.swift
//  TODO: List
//
//  Created by Alexander Abushady on 7/14/19.
//  Copyright © 2019 Alexander Abushady. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {
    
    // Outlet to the taskLabel.
    @IBOutlet weak var taskLabel: UILabel!
    
    var task : Task? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if task!.important {
            // Set the label to have its corresponding task name as the content.
            // The if statement will set the task to have an exclamation point if task.important = true.
            taskLabel.text = "\(task!.name!)❗️"
        } else {
            // Set the label to have its corresponding task name as the content.
            taskLabel.text = task!.name!
        }
    }
    
    @IBAction func completeTapped(_ sender: Any) {
        // The constant "context" gets the entity from Core Data.
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        // This allows us to delete the entity.
        context.delete(task!)
        
        // Save Core Data after deleting the selected task.
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        // Allows for returning to the main View Controller after adding a task.
        navigationController!.popViewController(animated: true)
    }
}
