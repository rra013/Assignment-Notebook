//
//  assignment.swift
//  Assignment Notebook
//
//  Created by Rishi Anand on 7/9/18.
//  Copyright © 2018 Rishi Anand. All rights reserved.
//

import Foundation

class Assignment{
    var name: String
    var className: String
    var description: String
    var dueDate: Int//Date
    init(name: String, className: String, description: String, dueDate: Int/*Date*/) {
        self.name = name
        self.className = className
        self.description = description
        self.dueDate = dueDate
    }
}
