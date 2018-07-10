//
//  assignment.swift
//  Assignment Notebook
//
//  Created by Rishi Anand on 7/9/18.
//  Copyright © 2018 Rishi Anand. All rights reserved.
//

import Foundation

class Assignment: Codable{
    var name: String
    var className: String
    var description: String
    var dueDate: Date
    init(name: String, className: String, description: String, dueDate: Date) {
        self.name = name
        self.className = className
        self.description = description
        self.dueDate = dueDate
    }
}
