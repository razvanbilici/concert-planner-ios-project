//
//  LoginViewModel.swift
//  project2024
//
//  Created by user264991 on 6/8/24.
//

// Bussiness logic
import Foundation
import FirebaseAuth

class LoginFormViewModel : ObservableObject {
    
    // Re-render view on change
    @Published var email_input = ""
    @Published var pass_input = ""
    @Published var error = ""
    
    init(){
        
    }
    
    func login(){
        
        print(email_input)
        
        guard validate() else {
            
            return
        }
        
        // Attempt login via firebaseAuth
        Auth.auth().signIn(withEmail: email_input, password: pass_input)
        print("login worked")
    }
    
    private func validate() -> Bool{
        
        error = ""
        
        guard !email_input.trimmingCharacters(in: .whitespaces).isEmpty,
              !pass_input.isEmpty else {
            
            error = "Enter your credentials!"
            return false
        }
        
        guard email_input.contains("@") && email_input.contains(".") else{
            
            error = "Enter a valid email address!"
            return false
            
        }
    return true
        
    }
}
