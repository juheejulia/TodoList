//
//  TodoListApp.swift
//  TodoList
//
//  Created by Juhee Kang Johansson on 2024-02-02.
//

/*
 Model - data point
 View - UI
 ViewModel - manages Models for View
 */

import SwiftUI

@main
struct TodoListApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
            // It makes all different size of device include ipad navigationview as standard
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
        }
    }
}
