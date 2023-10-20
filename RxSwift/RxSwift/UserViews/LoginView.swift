//
//  LoginView.swift
//  RxSwift
//
//  Created by Mac on 16/10/2023.
//

import SwiftUI

struct LoginView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @State var isPresentNextScreen = false
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("Email address")
                    .foregroundColor(Color.gray)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 0)
                ZStack(alignment: .bottom) {
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(Color.black)
                        .padding(.horizontal, 16)
                    CustomTextField(email: $email, placeholder: "Enter email")
                }
                .padding(.bottom, 50)
                Text("Password")
                    .foregroundColor(Color.gray)
                    .padding(.horizontal, 16)
                    .padding(.bottom, 5)
                ZStack(alignment: .bottom) {
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(Color.black)
                        .padding(.horizontal, 16)
                    SecureCustomTextField(text: $password, placeholder: "Enter password")
                }
                Spacer().frame(height: 150)
                Button(action: {
                    isPresentNextScreen.toggle()
                }) {
                    Text("Login")
                        .font(.system(size: 20, weight: .medium))
                        .foregroundColor(Color.white)
                        .padding(.horizontal, 20)
                        .frame(width: 300, height: 50)
                        .background(Color(hex: 0xFA4A0C))
                        .cornerRadius(25)
                        .position(x: 190)
                        .frame(width: 300, height: 50)
                        .controlSize(.large)
                }
                .sheet(isPresented: $isPresentNextScreen) {
                    HomeView()
                }
            }
        }
    }
}
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        
        LoginView()
    }
}
