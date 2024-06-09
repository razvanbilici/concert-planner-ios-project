//
//  AddConcertView.swift
//  project2024
//
//  Created by user264991 on 6/8/24.
//

import SwiftUI
import MapKit



struct AddConcertView: View {
    
    @StateObject var viewModel = AddConcertViewModel()
    @Binding var new_concert: Bool
    
    var body: some View {
        VStack{
            Text("Add Concert")
                .font(.system(size: 30))
                .bold()
                .padding(.top, 120)
            
            Form{
                // Artist
//                ArtistDropDown(options: ["heyp", "test"])
                TextField("Artist", text: $viewModel.artist).padding(.bottom)
                
                // Date
                DatePicker("Date", selection: $viewModel.date).datePickerStyle(GraphicalDatePickerStyle())
                
                // Venue
                TextField("Venue", text: $viewModel.venue)
                
                
//                LocationView()
                
                AbstractButton(title: "Add Concert", background: .cyan){
//                    viewModel.save()
//                    new_concert = false
                    
                    if viewModel.valid {
                        
                        viewModel.save()
                        new_concert = false
                        
                    }
                    else{
                        viewModel.alert = true
                    }
                }
                .alert(isPresented: $viewModel.alert){
                    Alert(title: Text(""), message: Text("Please select an artist!"))
                }
                
                
            }
        }
    }
}

#Preview {
    AddConcertView(new_concert: Binding(get: {
        return true
    }, set: { _ in
        // dummy
    }))
}
 
