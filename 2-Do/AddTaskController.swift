//
//  AddTaskControllerViewController.swift
//  2-Do
//
//  Created by Jordan Ventura Gaeta on 2/28/16.
//  Copyright © 2016 A290 Spring 2016-jvgaeta, irbrown. All rights reserved.
//

import UIKit

class AddTaskController: UIViewController {
    
    @IBOutlet var taskDescription: UITextField!
    @IBOutlet var taskName: UITextField!
    @IBOutlet weak var timePicker: UIDatePicker!
    
    var taskname: String = ""
    var taskdate: NSDate = NSDate()
    var taskdescription: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "doneSegue" {
            taskname = taskName.text!
            taskdate = timePicker.date
            taskdescription = taskDescription.text!
        }
    }

}
