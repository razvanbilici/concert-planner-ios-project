////
////  ArtistDropDown.swift
////  project2024
////
////  Created by user264991 on 6/9/24.
////
//
//import SwiftUI
//
//struct ArtistDropDown: View {
//
//    var options: [String]
//    /*@Binding*/ var selection: String?
//    
//    @State private var show_options: Bool = false
//    
//    var body: some View {
//        GeometryReader{
//            let size = $0.size
//            
//            VStack{
//                HStack{
//                    Text(selection ?? "Select")
//                        .foregroundStyle(selection == nil ? .gray : .primary)
//                    
//                    Spacer()
//                    Image(systemName: "chevron.down")
//                    
//                }
//                .frame(width: size.width, height: size.height)
//                .onTapGesture {
//                    withAnimation(.snappy){
//                        show_options.toggle()
//                        
//                    }
//                }
//                
//            }
//        }
//        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100, alignment: .center)
//    }
//}
//
//#Preview {
//    ArtistDropDown(options: [], selection: "")
//}
