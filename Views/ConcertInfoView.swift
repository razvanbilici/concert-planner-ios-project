//
//  ConcertInfoView.swift
//  project2024
//
//  Created by user264991 on 6/8/24.
//

import SwiftUI

struct ConcertInfoView: View {
    
    let concert: Concert
    @StateObject var viewModel = ConcertsViewModel()
    
    
    // DateFormatter property
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }
    
    // Formatted date string
    private var formattedDate: String {
        return dateFormatter.string(from: concert.date)
    }
    
    
    
    var body: some View {
        
        HStack{
            
            VStack{
                
                Text(concert.artist).font(.title).bold()
                Text(concert.venue)
                
                Text(formattedDate)
            }
            
            Spacer()
            
            Button{
              
            }
        label: {
            Image(systemName: concert.attended ? "checkmark.circle.fill" : "circle")
        }
            
        }
    }
}

#Preview {
    ConcertInfoView(concert: .init(id: "aa", artist: "bb", date: Date(), venue: "dd", attended: true))
}
