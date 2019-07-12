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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // These make the tableview look at the view controller for what content and how many cells should be added.
        tableView.dataSource = self
        tableView.delegate = self
    }
    // This function determines how many rows are in the table view.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    // This function determines what content is in the rows.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Constant that assigns to a cell. This allows for manipulation of content.
        let cell = UITableViewCell()
        cell.textLabel?.text = "Hello"
        return cell
    }
    
}

