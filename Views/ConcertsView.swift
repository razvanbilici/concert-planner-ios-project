//
//  ConcertsView.swift
//  project2024
//
//  Created by user264991 on 6/8/24.
//

import SwiftUI

struct ConcertsView: View {
    
    @StateObject var viewModel = ConcertsViewModel()
    
    private let user_id: String
    
    init(user_id: String){
        self.user_id = user_id
    }
    
    var body: some View {
//        Text("Test")
    
        NavigationView{
            NavigationView{
                VStack{
                    
                }
                .navigationTitle("My Concerts")
                .toolbar{
                    Button{
                        
                        // Toggle concert add view
                        viewModel.new_concert_view = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                .sheet(isPresented: $viewModel.new_concert_view){
                    AddConcertView(new_concert: $viewModel.new_concert_view)
                }
            }
        }
    }
}

#Preview {
    ConcertsView(user_id: "")
}
