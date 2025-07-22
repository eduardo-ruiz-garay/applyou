//
//  LoginView.swift
//  Applyou
//
//  Created by Eduardo Ruiz-Garay on 7/22/25.
//

import SwiftUI

struct LoginView: View {
    //Create a view model
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        VStack {
            // Header
            HeaderView(title: "To-Do List", subtitle: "Get things done", angle: 15, backgroundColor: .red)
            // Login Form
            
            Form {
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                        .foregroundColor(.red)
                        .font(.caption)
                        .padding()
                }
                
                TextField("Email Address", text: $viewModel.email)
                    .autocapitalization(.none)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TLButton(title: "Log In", backgroundColor: .blue) {
                    viewModel.login()
                }
                .padding()

            }
            //Create Account
            VStack {
                Text("New around here?")
                NavigationLink("Create an Account", destination: RegisterView())
                
                .padding(.bottom, 50)
            }
            Spacer()
        }
    }
}

#Preview {
    LoginView()
}
