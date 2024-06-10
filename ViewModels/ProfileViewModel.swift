//
//  ProfileViewModel.swift
//  project2024
//
//  Created by user264991 on 6/8/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ProfileViewModel: ObservableObject{
    
    @Published var user: User? = nil
    
    func logout(){
        
    }
    
    func get_user(){
        
        guard let user_id = Auth.auth().currentUser?.uid else{
            return
        }
        
        let db = Firestore.firestore()
        
        db.collection("users").document(user_id).getDocument{ [weak self] snapshot, error in
            guard let data = snapshot?.data(), error == nil else {
                return
            }
            
            DispatchQueue.main.async{
                
//                print("dataaaaaaaaa", data["id"] as? String ?? "mila")
                
                self?.user = User(
                    id: data["id"] as? String ?? "",
                    username: data["username"] as? String ?? "",
                    email: data["email"] as? String ?? ""
                )
            }
            
        }
        
    }
    

    
    
    init(){}
}
