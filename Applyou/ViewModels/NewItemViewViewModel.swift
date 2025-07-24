//
//  NewItemViewViewModel.swift
//  Applyou
//
//  Created by Eduardo Ruiz-Garay on 7/22/25.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewItemViewViewModel : ObservableObject{
    @Published var title: String = ""
    @Published var duedate: Date = Date()
    @Published var showAlert: Bool = false
    init() {
        
    }
    func save(){
        guard canSave else {
            return
        }
        // get current user id
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        // Create model
        let newId = UUID().uuidString
        let newItem = TodoListItem(id: newId, title: title, dueDate: duedate.timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false)
        
        // Save model under collection
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary())
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else { return false }
        guard duedate >= Date().addingTimeInterval(-86400) else { return false }
        return true
    }
}
