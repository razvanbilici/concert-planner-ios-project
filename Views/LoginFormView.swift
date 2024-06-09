//
//  LoginFormView.swift
//  project2024
//

//

import SwiftUI

struct LoginFormView: View {
    
    
    @StateObject var viewModel = LoginFormViewModel()
    
    var body: some View {
        Form {
            
            // Hide the password with a SecureField
            TextField("Email", 
                      text: $viewModel.email_input).autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
            
            SecureField("Password", text: $viewModel.pass_input)
            
            AbstractButton(title: "Login",
                           background: .cyan) {
                viewModel.login()
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
