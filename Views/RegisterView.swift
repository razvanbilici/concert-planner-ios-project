//
//  RegisterView.swift
//  project2024
//
//  Created by user264991 on 6/8/24.
//

import SwiftUI

struct RegisterView: View {
    
    @State var email_input = ""
    @State var pass_input = ""
    @State var username_input = ""

    
    var body: some View {
        VStack{
            
            HeaderView(title: "Register",
                       banner_angle: -15,
                       background: .gray)
            
            Form {
                
                // Hide the password with a SecureField
                TextField("Username", text: $username_input)
                TextField("Email", text: $email_input).autocapitalization(.none)
                SecureField("Password", text: $pass_input)
                AbstractButton(title: "Register", background: .green, action: {})
                
                
            }
            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}
