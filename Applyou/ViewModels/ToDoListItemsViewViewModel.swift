//
//  ToDoListItemsViewViewModel.swift
//  Applyou
//
//  Created by Eduardo Ruiz-Garay on 7/22/25.
//

import Foundation
import FirebaseFirestore

class ToDoListItemsViewViewModel :ObservableObject{
    @Published var showingNewItemView: Bool = false
    
    private let userId: String
    init(userId: String) {
        self.userId = userId
    }
    
    func delete(id: String) {
        let db = Firestore.firestore()
        
        db.collection("users").document(userId).collection("todos").document(id).delete()
    }
}
