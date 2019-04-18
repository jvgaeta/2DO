//
//  TaskModel.swift
//  2-Do
//
//  Created by Jordan Ventura Gaeta on 2/28/16.
//  Copyright © 2016 A290 Spring 2016-jvgaeta, irbrown. All rights reserved.
//

import UIKit

class Task: NSObject, NSCoding {
    var taskName : String
    var taskDate : NSDate
    var taskDescription: String
    
    override var description : String {
        return self.taskName + " " + String(self.taskDate) + " " + self.taskDescription
    }
    
    init(taskName:String, taskDate:NSDate, taskDescription:String) {
        self.taskName = taskName
        self.taskDate = taskDate
        self.taskDescription = taskDescription
        super.init()
    }
    
    func encodeWithCoder(coder: NSCoder) {
        // do not call super in this case
        coder.encodeObject(self.taskName, forKey: "name")
        coder.encodeObject(self.taskDate, forKey: "date")
        coder.encodeObject(self.taskDescription, forKey: "description")
    }
    
    required init?(coder: NSCoder) {
        self.taskName = coder.decodeObjectForKey("name") as! String
        self.taskDate = coder.decodeObjectForKey("date") as! NSDate
        self.taskDescription = coder.decodeObjectForKey("description") as! String
        // do not call super init(coder:) in this case
        super.init()
    }
    
}