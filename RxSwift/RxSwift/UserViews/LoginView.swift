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
            VStack() {
                Text("Email address")
                    .foregroundColor(Color.gray)
                    .padding()
                    .padding(.leading, -200)
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
                    .padding()
                    .padding(.leading, -200)
                ZStack(alignment: .bottom) {
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(Color.black)
                        .padding(.horizontal, 16)
                    SecureCustomTextField(text: $password, placeholder: "Enter password")
                }
                Spacer().frame(height: 180)
                CustomButton(title: "Login", action: {
                    isPresentNextScreen.toggle()
                })
                .fullScreenCover(isPresented: $isPresentNextScreen) {
                    ContentView()
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
