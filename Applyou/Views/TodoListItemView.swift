//
//  TodoListItemView.swift
//  Applyou
//
//  Created by Eduardo Ruiz-Garay on 7/22/25.
//

import SwiftUI

struct TodoListItemView: View {
    @StateObject var viewModel = TodoListItemViewViewModel()
    let item: TodoListItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title).font(.body).bold()
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))").font(.footnote).foregroundColor(Color(.secondaryLabel))
                
            }
            Spacer()
            
            Button {
                viewModel.toogleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ?  "checkmark.circle.fill" : "circle")
            }
        }
    }
}

#Preview {
    TodoListItemView(item: .init(id: "123", title: "Buy more eggs", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false))
}
