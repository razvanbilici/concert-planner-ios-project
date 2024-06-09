//
//  Extensions.swift
//  project2024
//
//  Created by user264991 on 6/9/24.
//

import Foundation

extension Encodable {
    
    func to_json() -> [String : Any] {
        
        guard let data = try? JSONEncoder().encode(self) else{
            
            // Return empty dictionary if the process fails
            return [:]
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String : Any]
            
            // if the json serialization fails return an empty dict
            return json ?? [:]
        } catch{
            return [:]
        }
    }
}
