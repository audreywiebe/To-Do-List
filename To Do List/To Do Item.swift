//
//  To Do Item.swift
//  To Do List
//
//  Created by Audrey Wiebe on 6/13/23.
//

import Foundation


class ToDoItem: Identifiable {
    var title = ""
    var isImportant = false
    var id = UUID()
    
    init(title: String, isImportant: Bool = false) {
        self.title = title
        self.isImportant = isImportant
    }
}
