//
//  ContentView.swift
//  Applyou
//
//  Created by Eduardo Ruiz-Garay on 7/22/25.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        NavigationView {
            if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
                //signed in
                ToDoListItemsView()
            } else {
                LoginView()
            }
        }.padding()
    }
}

#Preview {
    MainView()
}
