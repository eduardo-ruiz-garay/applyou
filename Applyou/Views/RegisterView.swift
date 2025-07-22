//
//  RegisterView.swift
//  Applyou
//
//  Created by Eduardo Ruiz-Garay on 7/22/25.
//

import SwiftUI

struct RegisterView: View {
    // Saves the date passed in by the user
    @StateObject var viewModel: RegisterViewViewModel = RegisterViewViewModel()
    
    var body: some View {
        VStack {
            // Header
            HeaderView(title: "Register", subtitle: "Create your account", angle: -15, backgroundColor: .green)
            
            Form {
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TLButton(title: "Register", backgroundColor: .pink) {
                    viewModel.register() 
                }
                .padding()
            }
            .offset(y: -50)
            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}
