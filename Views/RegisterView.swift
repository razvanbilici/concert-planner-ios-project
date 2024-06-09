//
//  RegisterView.swift
//  project2024
//
//  Created by user264991 on 6/8/24.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var viewModel = RegisterViewModel()

    
    var body: some View {
        VStack{
            
            HeaderView(title: "Register",
                       banner_angle: -15,
                       background: .gray)
//            .padding(.top, 50)
            
            Form {
                
                // Hide the password with a SecureField
                TextField("Username", text: $viewModel.username_input)
                TextField("Email", text: $viewModel.email_input).autocapitalization(.none)
                SecureField("Password", text: $viewModel.pass_input)
                AbstractButton(title: "Register", 
                               background: .green,
                               action: viewModel.register)
                
                
            }
            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}
