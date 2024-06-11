//
//  DropDownView.swift
//  project2024
//
//  Created by user264991 on 6/11/24.
//

import SwiftUI

struct DropDownView: View {
    
    let title: String
    let prompt: String
    let options: [String]
    
    @State private var isExpanded = false
    
    @Binding var selection: String?
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(title)
                .font(.footnote)
                .foregroundStyle(.gray)
                .opacity (0.8)
            VStack {
                HStack {
                    Text(selection ?? prompt)
                    
                    Spacer ()
                    Image (systemName: "chevron.down")
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                        .rotationEffect(.degrees(isExpanded ? -150 : 0))
                    
                }
                .frame(height: 40)
                .padding(.horizontal)
                .onTapGesture {
                    withAnimation(.snappy){
                        isExpanded.toggle()
                    }
                }
                if isExpanded {
                    VStack{
                        ForEach(options, id: \.self)  { option in
                            HStack{
                                Text(option)
                                    .foregroundStyle(selection == option ? Color.primary : .gray)
                                
                                Spacer()
                                
                                if selection == option {
                                    Image(systemName: "checkmark").font(.subheadline)
                                        .font(.subheadline)
                                }
                            }
                            .frame(height: 40)
                            .padding(.horizontal)
                            .onTapGesture {
                                withAnimation(.snappy){
                                    selection = option
                                    isExpanded.toggle()
                                    // Collapse menu after selection
                                }
                            }
                        }
                    }.transition(.move(edge: .bottom ))
                }
            }
        }
    }
}
#Preview {
    DropDownView(title: "Artist",
                 prompt: "Select an Artust",
                 options: ["a", "b"],
                 selection: .constant("a"))
}
