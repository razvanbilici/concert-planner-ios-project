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
    @Published var number_of_concerts: Int = 0
    
    func logout(){
        
        do{
            try Auth.auth().signOut()
        } catch{
            print("OOPS")
//            Alert(title: "something went wrong")
        }
        
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
        
        let concertsRef = db.collection("users").document(user_id).collection("concerts")
        
        // Execute the query to get all concert documents for the user
        concertsRef.getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error getting concert documents: \(error)")
            } else {
                // Check if there are documents in the query snapshot
                if let documents = querySnapshot?.documents {
                    
                                                
                    for _ in documents {

                            print("totallll", documents.count)
                        self.number_of_concerts = documents.count
                                    }
                                                    
                }
                
            }
        }}
    

    
    
    init(){}
}
