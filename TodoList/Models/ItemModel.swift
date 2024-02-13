//
//  ItemModel.swift
//  TodoList
//
//  Created by Juhee Kang Johansson on 2024-02-09.
//

/*
 Model - data point
 View - UI
 ViewModel - manages Models for View
 */

import Foundation

//Immutable Struct

struct ItemModel: Identifiable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    // init() Creates an instance of the app using the body that you define for its content.
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}

