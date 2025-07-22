//
//  LoginViewViewModel.swift
//  Applyou
//
//  Created by Eduardo Ruiz-Garay on 7/22/25.
//
import FirebaseAuth
import Foundation

class LoginViewViewModel : ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String = ""
    
    init() {
        
    }
    
    func login() {
        guard validate() else {
            return
        }
        // Login try with firebase
        Auth.auth().signIn(withEmail: email, password: password )
    }
    
    private func validate() -> Bool{
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill in all fields"
            return false
        }
        // email should have @ and .
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Invalid email format"
            return false
        }
        return true
    }
}
