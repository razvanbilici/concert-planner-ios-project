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
                VStack{
                        List(viewModel.concerts) {
                                concert in
                    //                    Text(concert.artist)
                               ConcertInfoView(concert: concert)
                                .swipeActions{
                                    Button("Remove Concert"){
                                        
                                        viewModel.remove(id: concert.id)
                                        viewModel.get_concerts()
                                        
                                    }.tint(.red)
                                }
                            
                            Button{
                                viewModel.toggle_attended(concert: concert)
                                viewModel.get_concerts()
                            }
                        label: {
                            Image(systemName: concert.attended ? "checkmark.circle.fill" : "circle")
                        }
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
                        .onDisappear{
                            viewModel.get_concerts()
                        }
                    
                }
            }.onAppear{
                viewModel.get_concerts()
            }
        
    }}


#Preview {
    ConcertsView()
}
