//
//  CreateTaskViewController.swift
//  TODO: List
//
//  Created by Alexander Abushady on 7/14/19.
//  Copyright © 2019 Alexander Abushady. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {

    // Outlet for the Task Name Textfield.
    @IBOutlet weak var taskNameTextField: UITextField!
    // Outlet for the Important Switch.
    @IBOutlet weak var importantSwitch: UISwitch!
    
    // Connects this view controller to the main view controller and gives it the variable previousVC
    var previousVC = ViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // Action function for button to add a Task.
    @IBAction func addTapped(_ sender: Any) {
        // Create a Task from the outlet information.
        let task = Task()
        task.name = taskNameTextField.text!
        task.important = importantSwitch.isOn
        
        // Add a new task to the array in main View Controller.
        previousVC.tasks.append(task)
        // Reloads the table data source and delegate with the new information.
        previousVC.tableView.reloadData()
        // Allows for returning to the main View Controller after adding a task.
        navigationController!.popViewController(animated: true)
    }
}
