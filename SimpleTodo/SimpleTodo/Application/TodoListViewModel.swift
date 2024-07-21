//
//  TodoListViewModel.swift
//  SimpleTodo
//
//  Created by 佐藤亮介 on 2024/07/19.
//

import Foundation

class TodoListViewModel: ObservableObject {
    @Published var todos: [Todo] = []
    @Published var isShowingEditTodoView: Bool = false
    @Published var selectedTodo: Todo?
    @Published var showingDeleteAlert: Bool = false
    @Published var todoToDelete: Todo?
    
    let todoRepository: TodoRepository
    
    init(todoRepository: TodoRepository) {
        self.todoRepository = todoRepository
        self.todos = todoRepository.getAll()
    }
    
    func getTodos() {
        self.todos = todoRepository.getAll()
    }
    
    func deleteTodo(todo: Todo) {
        todoRepository.delete(id: todo.id)
        getTodos()
    }
}
