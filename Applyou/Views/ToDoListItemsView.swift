//
//  ToDoListItemsView.swift
//  Applyou
//
//  Created by Eduardo Ruiz-Garay on 7/22/25.
//

import SwiftUI
import FirebaseFirestore

struct ToDoListItemsView: View {
    @StateObject var viewModel: ToDoListItemsViewViewModel
    @FirestoreQuery var items: [TodoListItem ]
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: ToDoListItemsViewViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    TodoListItemView(item: item)
                        .swipeActions{Button("Delete") {
                            viewModel.delete(id: item.id)
                        }
                        .tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView){
                NewItemView(isPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

#Preview {
    ToDoListItemsView(userId: "tjw6ATvTIVNM1WZwkB5Tq1mnAQ92")
}
