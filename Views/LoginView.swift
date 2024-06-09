//
//  LoginView.swift
//  project2024
//
//  Created by user264991 on 6/8/24.
//

import SwiftUI

struct LoginView: View {
    
    
    var body: some View {
        
        NavigationView{
            VStack{
                
                // Split it into separate views for cleaner code
                
                // App Title
                HeaderView(title: "Concert Planner",
                           banner_angle: 15,
                           background: .green)
                
                // Login Section
                LoginFormView()
                
                
                // Create Account Section
                VStack{
                    NavigationLink("Create Account",
                                   destination: RegisterView())
                }
                .padding(.bottom, 50)
                
            }
            
            // Push sections to the top
            Spacer()
        }
    }
}


#Preview {
    LoginView()
}
