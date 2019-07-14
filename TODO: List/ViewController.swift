//
//  ViewController.swift
//  TODO: List
//
//  Created by Alexander Abushady on 7/12/19.
//  Copyright © 2019 Alexander Abushady. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    // Creates the empty array tasks of type Task.
    var tasks : [Task] = []
    // Allows us to use the index to remove a task in the CompleteTaskViewController.
    var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
        // These make the tableview look at the view controller for what content and how many cells should be added.
        tableView.dataSource = self
        tableView.delegate = self
    }
    // This function determines how many rows are in the table view.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Returning the count of tasks array allows for the task array to dictate how many rows there will be.
        return tasks.count
    }
    // This function determines what content is in the rows.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Constant that assigns to a cell. This allows for manipulation of content.
        let cell = UITableViewCell()
        let task  = tasks[indexPath.row]
        if task.important {
            // Set each cell to have its corresponding task name as the content.
            // The if statement will set the task to have an exclamation point if task.important = true.
            cell.textLabel?.text = "\(String(describing: task.name))❗️"
        } else {
            // Set each cell to have its corresponding task name as the content.
            cell.textLabel?.text = task.name
        }
        return cell
    }
    
    // This function allows for functionality when a row is selected allowing for segue and for the app to be able to delete a task if it is completed.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // This variable is saved to be given to CompleteTaskViewController.
        selectedIndex = indexPath.row
        
        // Sends "Task Data" so that the proper task is segued too.
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "selectTaskSegue", sender: task)
    }
    
    
    // Segue performed when the plus button is tapped.
    @IBAction func plusTapped(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    // Takes entities from Core Data and places them into the tasks array.
    func getTasks() {
        
    }
    
    // Function allows communication between the two View Controllers to work in the segue.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // This segue launches if we are selecting an already added task.
        if segue.identifier == "selectTaskSegue" {
            let nextVC = segue.destination as! CompleteTaskViewController
            nextVC.task = sender as! Task
            nextVC.previousVC = self        }
    }
}

