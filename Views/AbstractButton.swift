//
//  AbstractButton.swift
//  project2024
//
//  Created by user264991 on 6/8/24.
//

import SwiftUI

struct AbstractButton: View {
    
    let title: String
    let background: Color
    
    // Closure
    let action: () -> Void
    
    var body: some View {
        Button{
            
            // Perform action
            action()
            
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                
                Text(title)
                    .foregroundColor(.white)
                    .bold()
            }
        }
    }
}

#Preview {
    AbstractButton(title: "Default",
                   background: .cyan,
                   action: {print("Nothing here beep boop")})
    
}
