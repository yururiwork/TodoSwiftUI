//
//  TodoEditView.swift
//  SimpleTodo
//
//  Created by 佐藤亮介 on 2024/07/21.
//

import SwiftUI

struct TodoEditView: View {
    @ObservedObject var viewModel: TodoEditViewModel
    @Environment(\.presentationMode) var presentationMode
    
    init(viewModel: TodoEditViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("タイトル")) {
                    TextField("タイトルを入力", text: $viewModel.todoTitle)
                }
            }
            .navigationTitle(viewModel.todo == nil ? "やることを追加" : "やることを変更")
            .navigationBarItems(leading: Button("キャンセル") {
                presentationMode.wrappedValue.dismiss()
            }, trailing: Button("保存") {
                if !viewModel.saveTodo() {
                    viewModel.showingAlert = true
                } else {
                    presentationMode.wrappedValue.dismiss()
                }
            }).alert(isPresented: $viewModel.showingAlert) {
                Alert(title: Text("Error"), message: Text(viewModel.errorMessage ?? "An unknown error occurred"), dismissButton: .default(Text("OK")))
            }            }
    }
}
