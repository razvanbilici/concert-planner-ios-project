//
//  ConcertsView.swift
//  project2024
//
//  Created by user264991 on 6/8/24.
//

import SwiftUI
import FirebaseFirestoreSwift
import Firebase
import FirebaseDatabase

struct ConcertsView: View {
    
    @StateObject var viewModel = ConcertsViewModel()
    
    
    // Fetching data
    //        self._items = FirestoreQuery(collectionPath: "users/\(user_id)/concerts")
    //        print("aaaaaaaaaaaaaaa", items.count)
    //        items = [Concert()]
    
    
    
    var body: some View {
        //        Text("Test")
        
        NavigationView{
            NavigationView{
                VStack{
                                        List(viewModel.concerts) {
                                            concert in
                    //                        Text(concert.artist)
                                            Text(concert.artist)
                                        }
                    
                    
                        .listStyle(PlainListStyle())
                    
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
            }.onAppear{
                viewModel.get_concert()
            }
        }
    }}


#Preview {
    ConcertsView()
}
