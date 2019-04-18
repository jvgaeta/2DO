//
//  TableViewController.swift
//  2-Do
//
//  Created by Jordan Ventura Gaeta on 2/28/16.
//  Copyright © 2016 A290 Spring 2016-jvgaeta, irbrown. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var appDelegate: AppDelegate?
    
    var newTask: String = ""
    var newTaskDescription: String = ""
    var newTaskDate: NSDate = NSDate()
    
    
    @IBAction func cancel(segue:UIStoryboardSegue) {
        
    }
    
    @IBAction func done(segue:UIStoryboardSegue) {
        if segue.identifier == "doneSegue" {
            let addTask = segue.sourceViewController as! AddTaskController
            newTask = addTask.taskname
            newTaskDescription = addTask.taskdescription
            newTaskDate = addTask.taskdate
            let task = Task(taskName: addTask.taskname, taskDate: addTask.taskdate, taskDescription: addTask.taskdescription)
            self.appDelegate?.taskModel.tasks.append(task)
            self.appDelegate?.taskModel.saveTasks()
            self.tableView.reloadData()
        }
        else if segue.identifier == "buttonSegueExit" {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (self.appDelegate?.taskModel.tasks.count)!
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let task = ((self.appDelegate?.taskModel.tasks[indexPath.row])! as Task)
        let cell = tableView.dequeueReusableCellWithIdentifier("taskCell", forIndexPath: indexPath)
        cell.textLabel!.text =  "• " + task.taskName
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "    'Due' MMM dd 'at' h:mm a"
        cell.detailTextLabel!.text = dateFormatter.stringFromDate(task.taskDate)
        return cell
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    }
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .Destructive, title: "Complete") { (action, indexPath) in
        self.appDelegate?.taskModel.tasks.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            self.appDelegate?.taskModel.saveTasks()
        }
        
        return [delete]
    }

    override func prepareForSegue(segue: UIStoryboardSegue,
        sender: AnyObject?) {
            
            if segue.identifier == "cellSegue" {
                let detailViewController = segue.destinationViewController
                    as! TaskDetailViewController
                let myIndexPath = self.tableView.indexPathForSelectedRow!
                let row = myIndexPath.row
                let task = ((self.appDelegate?.taskModel.tasks[row])! as Task)
                detailViewController.newTask = task.taskName
                detailViewController.newTaskDate = task.taskDate
                detailViewController.newTaskDescription = task.taskDescription
                detailViewController.taskIndex = row
            }
    }

}
