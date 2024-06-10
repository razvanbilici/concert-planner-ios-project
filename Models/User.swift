//
//  User.swift
//  project2024
//
//  Created by user264991 on 6/8/24.
//

import Foundation

// Codeable so we can convert to a dictionary in order to pass it to the firestore record insert method
struct User: Codable{
    
    let id: String
    let username: String
    let email: String
    
}
