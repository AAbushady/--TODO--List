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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // Action function for button to add a Task.
    @IBAction func addTapped(_ sender: Any) {
        
    }
}
