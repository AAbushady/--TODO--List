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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // This allows us to fill the array with the tasks from makeTasks.
        tasks = makeTasks()
        
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
            cell.textLabel?.text = "\(task.name)❗️"
        } else {
            // Set each cell to have its corresponding task name as the content.
            cell.textLabel?.text = task.name
        }
        return cell
    }
    
    // This function returns an array of type task.
    func makeTasks() -> [Task] {
        let task1 = Task()
        task1.name = "Walk the dog"
        task1.important = false;
        
        let task2 = Task()
        task2.name = "Buy Cheese"
        task2.important = true;
        
        let task3 = Task()
        task3.name = "Mow the Lawn"
        task3.important = false;
        
        return [task1, task2, task3]
    }
    
    
    @IBAction func plusTapped(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    // Function allows communication between the two View Controllers to work in the segue.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Assign nextVC to the CreateTaskViewController.
        let nextVC = segue.destination as! CreateTaskViewController
        // Give the previousVC a value of self so that both view controllers are now connected.
        nextVC.previousVC = self
    }
}

