//
//  PersistenceController.swift
//  SimpleTodo
//
//  Created by 佐藤亮介 on 2024/07/19.
//

import SwiftData

struct PersistenceController {
    static var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            SwiftDataTodo.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("error create sharedModelContainer: \(error)")
        }
    }()
}

