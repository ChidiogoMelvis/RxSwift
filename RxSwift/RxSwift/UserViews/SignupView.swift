//
//  SignupView.swift
//  RxSwift
//
//  Created by Mac on 16/10/2023.
//

import SwiftUI

struct SignupView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var reEnteredPassword: String = ""
    
    var body: some View {
        VStack() {
            Text("Email address")
                .foregroundColor(Color.gray)
                .padding()
                .padding(.leading, -200)
            ZStack(alignment: .bottom) {
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(Color.black)
                    .padding(.horizontal, 10)
                CustomTextField(email: $email, placeholder: "Enter email")
            }
            .padding(.bottom, 5)
            Text("Password")
                .foregroundColor(Color.gray)
                .padding()
                .padding(.leading, -200)
            ZStack(alignment: .bottom) {
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(Color.black)
                    .padding(.horizontal, 16)
                SecureCustomTextField(text: $password, placeholder: "Enter password")
            }
            
            .padding(.bottom, 5)
            Text("Re-enter Password")
                .foregroundColor(Color.gray)
                .padding()
                .padding(.leading, -200)
            ZStack(alignment: .bottom) {
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(Color.black)
                    .padding(.horizontal, 16)
                SecureField("Re-enter password", text: $password)
                    .padding(.horizontal, 16)
            }
            Spacer().frame(height: 40)
            CustomButton(title: "Sign up", action: {
                //isPresentNextScreen.toggle()
            })
        }
        
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
