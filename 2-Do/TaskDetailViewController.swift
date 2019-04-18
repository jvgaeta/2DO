//
//  TaskDetail.swift
//  2-Do
//
//  Created by Jordan Ventura Gaeta on 2/28/16.
//  Copyright © 2016 A290 Spring 2016-jvgaeta, irbrown. All rights reserved.
//

import UIKit

class TaskDetailViewController: UIViewController {
    
    @IBOutlet var taskDate: UILabel!
    @IBOutlet var taskName: UILabel!
    @IBOutlet var taskDescription: UILabel!
    @IBOutlet var button: UIButton!
    var appDelegate: AppDelegate?
    
    @IBAction func deleteItem() {
        self.appDelegate?.taskModel.tasks.removeAtIndex(taskIndex)
        self.appDelegate?.taskModel.saveTasks()
    }
    
    var newTask: String = ""
    var newTaskDate: NSDate = NSDate()
    var newTaskDescription: String = ""
    var taskIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        self.appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "'Due' MMM dd 'at' h:mm a"
        self.taskDate.text = dateFormatter.stringFromDate(newTaskDate)
        self.taskName.text = self.newTask
        self.taskDescription.text = self.newTaskDescription
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
