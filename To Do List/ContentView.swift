//
//  ContentView.swift
//  To Do List
//
//  Created by Audrey Wiebe on 6/13/23.
//

import SwiftUI

struct ContentView: View {
//    @State var toDoItems: [ToDoItem] = []
   
    @Environment(\.managedObjectContext) var context
    @State private var showNewTask = false
    
    @FetchRequest(
      entity: ToDo.entity(), sortDescriptors: [ NSSortDescriptor(keyPath: \ToDo.id, ascending: false) ])
        
    var toDoItems: FetchedResults<ToDo>
    
    var body: some View {
        VStack {
            HStack {
                Text("To Do!")
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
                     Text("‼️" + (toDoItem.title ?? "No title"))
                    } else {
                         Text(toDoItem.title ?? "No title")
                    }
                
                }
                .onDelete(perform: deleteTask)
            }
        }
        
        .padding()
        if showNewTask {
            NewToDoView(title: "", isImportant: false, showNewTask: $showNewTask)
                }
    }
    private func deleteTask(offsets: IndexSet) {
            withAnimation {
                offsets.map { toDoItems[$0] }.forEach(context.delete)

                do {
                    try context.save()
                } catch {
                    print(error)
                }
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
