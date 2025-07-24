//
//  TodoListItem.swift
//  Applyou
//
//  Created by Eduardo Ruiz-Garay on 7/22/25.
//

import Foundation

struct TodoListItem: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    mutating func toggleDone(_ state: Bool) {
        isDone = state
    }
}
