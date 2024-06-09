//
//  RegisterViewModel.swift
//  project2024
//
//  Created by user264991 on 6/8/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewModel: ObservableObject {
    
    @Published var email_input = ""
    @Published var pass_input = ""
    @Published var username_input = ""
    
    init(){}
    
    func register(){
        
        guard validate() else {
            return
        }
        
        // weak so we avoid memory leaks
        Auth.auth().createUser(withEmail: email_input, password: pass_input) { [weak self] result, error in
            
            guard let user_id = result?.user.uid else {
                print("error")
                return
            }
            
            self?.insert_user(id: user_id)
            print("worked")
        }
    }
    
    private func insert_user(id: String) {
        
        let user = User(id: id, username: username_input, email: email_input)
        
        let db = Firestore.firestore()
        db.collection("users").document(id).setData(user.to_json())
    }
    
    private func validate() -> Bool{
        
        guard !email_input.trimmingCharacters(in: .whitespaces).isEmpty,
              !pass_input.isEmpty, 
              !username_input.isEmpty
        else {
            
//            error = "Enter your credentials!"
            return false
        }
        
        guard email_input.contains("@") && email_input.contains(".") else{
            
//            error = "Enter a valid email address!"
            return false
        }
        
        guard pass_input.count >= 5 else {
            return false
        }
    return true
        
    }
}
