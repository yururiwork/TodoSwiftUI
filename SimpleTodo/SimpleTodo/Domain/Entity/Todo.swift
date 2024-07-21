//
//  Todo.swift
//  SimpleTodo
//
//  Created by 佐藤亮介 on 2024/07/18.
//

import Foundation
import SwiftData

struct Todo: Identifiable {
    var id: UUID = UUID()
    var title: String
}
