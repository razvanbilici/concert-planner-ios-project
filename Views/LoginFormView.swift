//
//  LoginFormView.swift
//  project2024
//
//  Created by user264991 on 6/8/24.
//

import SwiftUI

struct LoginFormView: View {
    
    
    @State var email_input = ""
    @State var pass_input = ""
    
    var body: some View {
        Form {
            
            // Hide the password with a SecureField
            TextField("Email", text: $email_input).autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
            SecureField("Password", text: $pass_input)
            AbstractButton(title: "Login",
                           background: .cyan) {
                // None
            }
           
            
//            Button{
//                
//            } label: {
//                ZStack{
//                    RoundedRectangle(cornerRadius: 10)
//                    Text("Login")
//                        .foregroundColor(.white)
//                        .bold()
//                }
//            }
        }
    }
}

#Preview {
    LoginFormView()
}
