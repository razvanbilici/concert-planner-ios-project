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
                    
                    if let user = viewModel.user{
                        
                        Image(systemName: "person.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.blue)
                            .frame(width: 125, height: 125)
                            .padding()
                        
                        VStack(alignment: .leading){
                            
                            HStack{
                                Text("Username").bold()
                                Text(user.username)
                            }.padding()
                            
                            
                            HStack{
                                Text("Email").bold()
                                Text(user.email)
                            }.padding()
                            
                            
                            HStack
                            {
                                Text("Total Number Of Concerts:").bold()
                                Text("\(viewModel.number_of_concerts)")
                            }.padding()
                            
                        }
                            
                            Button("Logout"){
                                viewModel.logout()
                            }.tint(.red).padding()
                            
                            Spacer()
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
