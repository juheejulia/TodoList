//
//  ItemModel.swift
//  TodoList
//
//  Created by Juhee Kang Johansson on 2024-02-09.
//

import Foundation

struct ItemModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
}
