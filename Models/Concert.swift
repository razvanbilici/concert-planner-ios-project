//
//  Concert.swift
//  project2024
//
//  Created by user264991 on 6/8/24.
//

import Foundation

struct Concert: Codable, Identifiable{
//
//    var id = ""
//    var artist: String = ""
//    var date = Date()
//    var venue = ""
//    var attended = false
    
    let id: String
    let artist: String
    let date:  Date
    let venue:  String
    var attended: Bool
    
//    init(id: String = "", artist: String, date: Date = Date(), venue: String = "", attended: Bool = false) {
//        self.id = id
//        self.artist = artist
//        self.date = date
//        self.venue = venue
//        self.attended = attended
//    }
//    
//    init(){
//        
//    }
    

//    
    mutating func set_attended(_ state: Bool){
        attended = state
    }
    
//    init(id: String = "", artist: Artist, date: Date = Date(), venue: String = "", attended: Bool = false) {
//        self.id = id
//        self.artist = artist
//        self.date = date
//        self.venue = venue
//        self.attended = attended
//    }
    
}
