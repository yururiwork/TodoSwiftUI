//
//  TodoListView.swift
//  SimpleTodo
//
//  Created by 佐藤亮介 on 2024/07/19.
//

import SwiftUI

struct TodoListView: View {
    @StateObject var viewModel: TodoListViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.todos.isEmpty {
                    Text("やることがありません")
                        .font(.title)
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    List {
                        ForEach(viewModel.todos) { todo in
                            HStack {
                                Text(todo.title)
                                    .frame(maxWidth: .infinity, alignment: .leading)  // Expand title to fill available space
                                    .contentShape(Rectangle())  // Make the entire area tappable
                                    .onTapGesture {
                                        viewModel.selectedTodo = todo
                                        viewModel.isShowingEditTodoView = true
                                    }
                                Spacer()
                                Button(action: {
                                    viewModel.todoToDelete = todo
                                    viewModel.showingDeleteAlert = true
                                }) {
                                    Image(systemName: "trash")
                                        .foregroundColor(.red)
                                        .padding(.horizontal, 8)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("やることリスト")
            .navigationBarItems(trailing: Button(action: {
                viewModel.selectedTodo = nil
                viewModel.isShowingEditTodoView = true
            }) {
                Image(systemName: "plus")
            })
            .sheet(isPresented: $viewModel.isShowingEditTodoView) {
                if let selectedTodo = viewModel.selectedTodo {
                    TodoEditView(viewModel: TodoEditViewModel(todoRepository: viewModel.todoRepository, todo: selectedTodo)).onDisappear {
                        viewModel.getTodos()
                    }
                } else {
                    TodoEditView(viewModel: TodoEditViewModel(todoRepository: viewModel.todoRepository)).onDisappear {
                        viewModel.getTodos()
                    }
                }
            }.alert(isPresented: $viewModel.showingDeleteAlert) {
                Alert(title: Text("TODO削除"),
                      message: Text("削除してよろしいですか？"),
                      primaryButton: .destructive(Text("削除")) {
                    if let todo = viewModel.todoToDelete {
                        viewModel.deleteTodo(todo: todo)
                    }
                },
                      secondaryButton: .cancel(Text("キャンセル")))
            }
        }
    }
}
