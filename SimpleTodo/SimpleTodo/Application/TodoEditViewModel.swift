//
//  TodoEditViewModel.swift
//  SimpleTodo
//
//  Created by 佐藤亮介 on 2024/07/21.
//

import Foundation

class TodoEditViewModel: ObservableObject {
    @Published var todo: Todo?
    @Published var todoTitle: String
    @Published var errorMessage: String?
    @Published var showingAlert: Bool = false
    
    private let todoRepository: TodoRepository
    
    init(todoRepository: TodoRepository, todo: Todo? = nil) {
        self.todoRepository = todoRepository
        self.todo = todo
        self.todoTitle = todo?.title ?? ""
    }
    
    func saveTodo() -> Bool {
        guard !todoTitle.isEmpty else {
            errorMessage = "タイトルが入力されていません"
            return false
        }
        if let todo = todo {
            todoRepository.update(id: todo.id, title: todoTitle)
        } else {
            todoRepository.create(title: todoTitle)
        }
        return true
    }
}
