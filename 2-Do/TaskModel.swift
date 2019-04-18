//
//  TaskModel.swift
//  2-Do
//
//  Created by Jordan Ventura Gaeta on 2/28/16.
//  Copyright © 2016 A290 Spring 2016-jvgaeta, irbrown. All rights reserved.
//

import UIKit

class TaskModel {
    
    var tasksdict: [Int: Task] = [Int: Task]()
    var tasks: [Task] = [Task]()
    
    func getFileURL(fileName: String) -> String {
        let manager = NSFileManager.defaultManager()
        do {
            let dirURL = try manager.URLForDirectory(.DocumentDirectory, inDomain: .UserDomainMask, appropriateForURL: nil, create: false)
            return dirURL.URLByAppendingPathComponent(fileName).path!
        }
        catch {
            print("woops")
        }
        return "NULL"
    }
    
    func retrieveTasks() {
        let fm = NSFileManager()
        let filePath = getFileURL("tasks")
        if fm.fileExistsAtPath(filePath) {
            self.tasksdict = NSKeyedUnarchiver.unarchiveObjectWithFile(filePath) as! [Int: Task]
            self.tasks = [Task](self.tasksdict.values)
        }
    }
    
    func saveTasks() {
        self.tasksdict = [:]
        if (self.tasks.count > 0) {
            for var index = 0; index < self.tasks.count; ++index {
                self.tasksdict[index] = self.tasks[index]
            }
        }
        let fm = NSFileManager()
        let filePath = getFileURL("tasks")
        if fm.fileExistsAtPath(filePath) {
            do {
                try fm.removeItemAtPath(filePath)
            }
            catch {
                print("woops.")
            }
        }
        NSKeyedArchiver.archiveRootObject(self.tasksdict, toFile: filePath)
    }
    
    
}
