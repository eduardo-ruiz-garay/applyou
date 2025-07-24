//
//  TodoListItemViewViewModel.swift
//  Applyou
//
//  Created by Eduardo Ruiz-Garay on 7/22/25.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class TodoListItemViewViewModel :ObservableObject{
    
    func toogleIsDone(item: TodoListItem) {
        var newItem = item
        newItem.toggleDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users").document(uid).collection("todos").document(newItem.id).setData(newItem.asDictionary())
    }
}
