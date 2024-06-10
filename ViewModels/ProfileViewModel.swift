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
    
    func get_conc(){
        let db = Firestore.firestore()
                
                // Replace "user_id" with the actual ID of the user whose concerts you want to fetch
                let userId = "XC6uhztDk1ZpK2pDlZalpeIikws1"
                
                // Construct the path to the concerts subcollection for the user
                let concertsRef = db.collection("users").document(userId).collection("concerts")
                
                // Execute the query to get all concert documents for the user
                concertsRef.getDocuments { (querySnapshot, error) in
                    if let error = error {
                        print("Error getting concert documents: \(error)")
                    } else {
                        // Check if there are documents in the query snapshot
                        if let documents = querySnapshot?.documents {
                            for document in documents {
                                // Access the data in each concert document
                                let data = document.data()
                                // Handle the concert data as needed
                                print(data)
                            }
                        }
                    }
                }
            }
    
    
    init(){}
}
