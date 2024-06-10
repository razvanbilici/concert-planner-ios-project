

import SwiftUI
import Firebase

class MainViewModel: ObservableObject{
    
    @Published var current_user_id: String = "default"
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _,user in
            
            DispatchQueue.main.async {
                self?.current_user_id = user?.uid ?? ""
                
            }
        }
//        print(currentUserId)
    }
    
    public var is_signed_in: Bool {
        return Auth.auth().currentUser != nil
        
    }
}
