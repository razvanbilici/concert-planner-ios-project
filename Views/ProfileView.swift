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
            NavigationView{
                VStack{
                    
                }
                .navigationTitle("Profile")
            }
        }
    }
}

#Preview {
    ProfileView()
}
