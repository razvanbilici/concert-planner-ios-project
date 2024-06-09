//
//  MainViewModel.swift
//  project2024
//
//  Created by user264991 on 6/8/24.
//

import Foundation
import FirebaseAuth

class MainViewModel: ObservableObject{
    
    @Published var current_user_id: String = ""
    private var listener:  AuthStateDidChangeListenerHandle? = nil
    
    // Check via firebase when the current user has changed
    init(){
        
        self.listener = Auth.auth().addStateDidChangeListener{[weak self] _, userr in
            
            DispatchQueue.main.async {
                self?.current_user_id = userr?.uid ?? ""
            }
        }
    }
    
    public var is_signed_in: Bool {
        return Auth.auth().currentUser != nil
        
    }
}
