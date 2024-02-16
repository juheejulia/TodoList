/*
 Model - data point
 View - UI
 ViewModel - manages Models for View
 */

import Foundation

/*
 CRUD FUNCTIONS
 
 Create
 Read
 Update
 Delete
 */


    // ObservableObject is part of the data flow. It is used to notify views when there's a change in the data they're observing. To declare an Observable Object, we use the @Published and @ObservedObject property wrappers.
class ListViewModel: ObservableObject {
    
    //@Published is a property wrapper that allows you to mark a property of a class as observable, meaning that any changes to its value will trigger an update in the views tat depend on it.
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    let itemsKey: String = "items_list"
    
    // init() Creates an instance of the app using the body that you define for its content.
    init() {
        getItem()
    }
    
    func getItem() {
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        
        self.items = savedItems
        
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel) {
        
//        if let index = items.firstIndex{ (existingItem) -> Bool in
//            return existingItem.id == item.id
//        } {
//            // run this code
//        }
        
        if let index = items.firstIndex(where: {$0.id == item.id}) {
            items[index] = item.updateCompletion()
        }
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}
