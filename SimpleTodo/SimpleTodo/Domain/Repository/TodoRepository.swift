//
//  TodoRepository.swift
//  SimpleTodo
//
//  Created by 佐藤亮介 on 2024/07/18.
//

import Foundation

protocol TodoRepository {
    func getAll() -> [Todo]
    func create(title: String)
    func update(id: UUID, title: String)
    func delete(id: UUID)
}
