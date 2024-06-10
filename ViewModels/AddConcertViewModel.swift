//
//  AddConcertViewModel.swift
//  project2024
//
//  Created by user264991 on 6/8/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class AddConcertViewModel:  ObservableObject{
    
    
    
    @Published var artist: String = ""
    @Published var date:  Date = Date()
    @Published var venue:  String = ""
    @Published var attended: Bool = false
    @Published var alert = false
    
    init(){
        
    }
 
    
    func save(){
        
        
        guard valid else{
            print("error")
            return
        }
        
        // get logged user
        guard let uid = Auth.auth().currentUser?.uid else{
            print("id")
            return
        }
        
        // create model
        let new_id = UUID().uuidString
        let new_concert = Concert(
            id: new_id,
            artist: artist,
            date: date,
            venue: venue,
            attended: attended
        )
//
//        print(new_concert.artist)
        print(new_concert.to_json())

        
        // save model
        let db = Firestore.firestore()
    
        
        db.collection("users")
            .document(uid)
            .collection("concerts")
            .document(new_id)
            .setData(new_concert.to_json())
    }
    
    var valid: Bool {
        
        guard !artist.isEmpty else{
            
            
            return false
            
        }
        return true
    }

    
    
}
