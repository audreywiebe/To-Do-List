//
//  ContentView.swift
//  To Do List
//
//  Created by Audrey Wiebe on 6/13/23.
//

import SwiftUI

struct ContentView: View {
    @State var toDoItems: [ToDoItem] = []
    @State private var showNewTask = false
    var body: some View {
        VStack {
            HStack {
                Text("Grind time")
                    .font(.system(size: 40))
                    .fontWeight(.black)
                Spacer()
                
                Button(action: {
                    self.showNewTask = true
                }) {
                Text("+")
                }
            }
            .padding()
            Spacer()
            List {
                ForEach(toDoItems) {toDoItem in
                    if toDoItem.isImportant == true {
                    Text("‼️" + toDoItem.title)
                    }
                    else {
                    Text(toDoItem.title)
                    }
                
                }
            }
        }
        
        .padding()
        if showNewTask {
            NewToDoView(title: "", isImportant: false, toDoItems: .constant([]), showNewTask: $showNewTask)
                }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
