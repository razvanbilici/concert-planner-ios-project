//
//  ProfileView.swift
//  project2024
//
//  Created by user264991 on 6/8/24.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewModel()
    
    var body: some View {
        
            NavigationView{
                VStack{
                    if let user = viewModel.user {
                        
                        Text(user.username)
                        
                    }
                }
                .navigationTitle("Profile")
            }
            .onAppear{
                viewModel.get_user()
            }
        }
    
}

#Preview {
    ProfileView()
}
