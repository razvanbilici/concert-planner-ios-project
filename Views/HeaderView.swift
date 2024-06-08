//
//  HeaderView.swift
//  project2024
//
//  Created by user264991 on 6/8/24.
//

import SwiftUI

struct HeaderView: View {
    
     // Template for all header views
    let title: String
    let banner_angle: Double
    let background: Color
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background)
                .rotationEffect(Angle(degrees: banner_angle))
            
            VStack{
                Text(title)
                    .foregroundColor(.white)
                    .bold()
                    .font(.system(size: 50))
            }
        }
        
        // Make the frame larger than the screen width
        // So that the 15-degree-angled banner fits the screen
        // Negative offset so that it moves to the top
        .frame(width: UIScreen.main.bounds.width * 2,
                height:300)
            .offset(y: -120)
    }
}

#Preview {
    HeaderView(title: "Default",
                banner_angle: 0,
               background: .blue)
}
