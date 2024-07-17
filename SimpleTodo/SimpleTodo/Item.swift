//
//  Item.swift
//  SimpleTodo
//
//  Created by 佐藤亮介 on 2024/07/17.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
