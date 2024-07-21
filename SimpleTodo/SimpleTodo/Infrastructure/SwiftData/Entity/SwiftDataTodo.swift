//
//  SwiftDataTodo.swift
//  SimpleTodo
//
//  Created by 佐藤亮介 on 2024/07/18.
//

import SwiftData
import SwiftUI

@Model
final class SwiftDataTodo: Identifiable {
    @Attribute(.unique) var id: UUID = UUID()
    @Attribute var title: String
    
    init(title: String) {
        self.title = title
    }
}
