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
    
    var task = Task()
    // Connects the main View Controller with the variable previousVC
    var previousVC = ViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if task.important {
            // Set the label to have its corresponding task name as the content.
            // The if statement will set the task to have an exclamation point if task.important = true.
            taskLabel.text = "\(task.name)❗️"
        } else {
            // Set the label to have its corresponding task name as the content.
            taskLabel.text = task.name
        }
    }
    
    @IBAction func completeTapped(_ sender: Any) {
        // Takes the selectedIndex from the main view controller and removes the task at that index.
        previousVC.tasks.remove(at: previousVC.selectedIndex)
        // Reloads the table data source and delegate with the new information.
        previousVC.tableView.reloadData()
        // Allows for returning to the main View Controller after adding a task.
        navigationController!.popViewController(animated: true)
    }
}
