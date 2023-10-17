//
//  SignupSigninView.swift
//  RxSwift
//
//  Created by Mac on 14/10/2023.
//

import SwiftUI

struct SignupLoginView: View {
    @State var selectedTab = 0
    let customColor = Color(hex: 0xEDEDED)
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                Spacer().frame(height: 70)
                Image(uiImage: UIImage(named: "appLogo")!)
                    .resizable()
                    .frame(width: 150, height: 150)
                    .padding(.bottom, 100)
                HStack(spacing: 100) {
                    Text("Login")
                        .font(.title)
                        .onTapGesture {
                            selectedTab = 0
                        }
                    
                    Text("Sign Up")
                        .font(.title)
                        .onTapGesture {
                            selectedTab = 1
                        }
                }
                if selectedTab == 0 {
                    LoginView()
                        .padding(.top, 10)
                } else {
                    SignupView()
                        .padding(.top, 10)
                }
                
                Spacer()
            }
            
        }
    }
}

struct SignupSigninView_Previews: PreviewProvider {
    static var previews: some View {
        SignupLoginView()
    }
}
