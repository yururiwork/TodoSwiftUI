//
//  SwiftDataTodoRepository.swift
//  SimpleTodo
//
//  Created by 佐藤亮介 on 2024/07/18.
//

import SwiftData
import SwiftUI
import CoreData

class SwiftDataTodoRepository: TodoRepository {
    private var modelContext: ModelContext
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }
    
    func getAll() -> [Todo] {
        do {
            let request = FetchDescriptor<SwiftDataTodo>()
            let entities = try modelContext.fetch(request)
            return entities.map { Todo(id: $0.id, title: $0.title) }
        } catch {
            print("Failed to fetch todos: \(error)")
            return []
        }
    }
    
    func create(title: String) {
        let newTodo = SwiftDataTodo(title: title)
        modelContext.insert(newTodo)
        do {
            try modelContext.save()
        } catch {
            print("Failed to add todo: \(error)")
        }
    }
    
    func update(id: UUID, title: String) {
        let fetchRequest = FetchDescriptor<SwiftDataTodo>(predicate: #Predicate { $0.id == id })
        do {
            if let entity = try modelContext.fetch(fetchRequest).first {
                entity.title = title
                try modelContext.save()
            }
        } catch {
            print("Failed to update todo: \(error)")
        }
    }
    
    func delete(id: UUID) {
        do {
            try modelContext.delete<SwiftDataTodo>(model: SwiftDataTodo.self, where: #Predicate { todo in
                todo.id == id
            }, includeSubclasses: true)
            try modelContext.save()
        } catch {
            print("Failed to delete todo: \(error)")
        }
    }
}

