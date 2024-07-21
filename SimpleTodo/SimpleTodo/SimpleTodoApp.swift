//
//  SimpleTodoApp.swift
//  SimpleTodo
//
//  Created by 佐藤亮介 on 2024/07/17.
//

import SwiftUI
import SwiftData

@main
struct SimpleTodoApp: App {
    let container = PersistenceController.sharedModelContainer
    var body: some Scene {
        WindowGroup {
            let todoRepository = SwiftDataTodoRepository(modelContext: container.mainContext)
            let viewModel = TodoListViewModel(todoRepository: todoRepository)
            TodoListView(viewModel: viewModel)
        }
        .modelContainer(container)
    }
}
