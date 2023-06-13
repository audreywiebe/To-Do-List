//
//  To Do Item.swift
//  To Do List
//
//  Created by Audrey Wiebe on 6/13/23.
//

import Foundation

class ToDoItem {
    var title = ""
    var isImportant = false
    
    init(title: String, isImportant: Bool = false) {
        self.title = title
        self.isImportant = isImportant
    }
}
