//
//  AddView.swift
//  TodoList
//
//  Created by Juhee Kang Johansson on 2024-02-02.
//

import SwiftUI

struct AddView: View {
    
    // @Environment property wrapper is a collection of key-value pairs that SwitUI uses to store and propagate various information across views. It takes a key path of an EnvironmentValues structure as an argument, and returns the corresponding value.
    
    // @EnvironmentObject allows data to be shared across multiple views. It simplify the process of passing data through different levels of view hierarchy, making code cleaner and more efficient.
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModle: ListViewModel
    @State var textFieldText: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here ...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                
                Button(action: saveButtonPressed, label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
            }
            .padding(14)
        }
        .navigationTitle("Add an Item 🖌")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveButtonPressed() {
        if textIsAppropriate() {
            listViewModle.addItem(title: textFieldText)
            // Page turns to ListView when saveButtonPressed
            presentationMode.wrappedValue.dismiss()
        }
    }
    // ctr + cmd + space shows imoji panel
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 1 {
            alertTitle = "Your new todo item must be at least 1 character long.  😱🤯🥶"
            showAlert.toggle()
            
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}

