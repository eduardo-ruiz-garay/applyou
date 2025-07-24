//
//  NewItemView.swift
//  Applyou
//
//  Created by Eduardo Ruiz-Garay on 7/22/25.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var isPresented: Bool
    var body: some View {
        VStack {
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding()
            Form {
                // Title
                TextField("Title", text: $viewModel.title)
                // Due Date
                DatePicker("Due Date", selection: $viewModel.duedate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                // Button
                TLButton(title: "Save", backgroundColor: .pink) {
                    if viewModel.canSave {
                        viewModel.save()
                        isPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                }
                .padding()
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Error"), message: Text("Please fill in all fields and select due date that is today or newer."))
            }
        }
    }
}

#Preview {
    NewItemView(isPresented: Binding(get: {
        return true
    }, set: { _ in
        
    }))
}
