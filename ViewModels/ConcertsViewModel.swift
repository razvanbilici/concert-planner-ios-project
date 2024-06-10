//
//  ConcertsViewModel.swift
//  project2024
//
//  Created by user264991 on 6/8/24.
//

import SwiftUI
import FirebaseFirestoreSwift
import Firebase
import FirebaseDatabase

class ConcertsViewModel: ObservableObject{
    
    @Published var new_concert_view = false
    @Published var concerts: [Concert] = []
    
    func get_concert(){
        
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
                                //                                print("dataaaa", data["venue"] as? String ?? "rip")
                                
                                
                                let concert = Concert(id: data["id"] as? String ?? "",
                                                      artist: data["artist"] as? String ?? "",
                                                      date: data["date"] as? Date ?? Date(),
                                                      venue: data["venue"] as? String ?? "",
                                                      attended: data["attended"] as? Bool ?? false)
                                print("yepp", concert.artist)
                                self.concerts.append(concert)
                                }
                                
                            }
                        }
                    }
                }
    
    init(){}
}
