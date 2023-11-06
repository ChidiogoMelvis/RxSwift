//
//  UserView.swift
//  RxSwift
//
//  Created by Mac on 25/10/2023.
//

import SwiftUI

struct UserView: View {
    var body: some View {
        Color(hex: 0xEDEDED)
            .edgesIgnoringSafeArea(.all)
            .overlay (
                VStack {
                    Text("My Profile")
                        .foregroundColor(.black)
                        .font(.system(size: 35))
                        .fontWeight(.medium)
                        .padding(.top, 40)
                        .padding(.trailing, 150)
                    
                    HStack {
                        Text("Personal details")
                            .foregroundColor(.black)
                            .padding(.top, 10)
                            .padding(.trailing, 130)
                            .fontWeight(.semibold)
                        Button {
                            print("")
                        } label: {
                            Text("change")
                                .foregroundColor(Color(hex: 0xFA4A0C))
                        }
                    }
                    PersonalDetailsView()
                        .padding(.bottom, 60)
                    UserContents()
                        .padding(.top, -60)
                    CustomButton(title: "Update") {
                        print("")
                    }
                    .padding(.top, 50)
                    Spacer()
                }
            )
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
struct UserContents: View {
    var body: some View {
            VStack(alignment: .center, spacing: 20) {
                NavigationLink(destination: Text("Orders")) {
                    HStack(spacing: 190) {
                        Text("Orders")
                            .padding(.leading, 20)
                            .foregroundColor(Color.black)
                        Image(systemName: "chevron.right")
                            .foregroundColor(Color.black)
                            .padding(.trailing, 20)
                    }
                    .frame(width: 315, height: 60)
                    .background(Color.white)
                    .cornerRadius(20)
                }
                NavigationLink(destination: Text("Pending reviews")) {
                    HStack(spacing: 120) {
                        Text("Pending reviews")
                            .padding(.leading, 20)
                            .foregroundColor(Color.black)
                            .lineLimit(0)
                        Image(systemName: "chevron.right")
                            .padding(.trailing, 20)
                            .foregroundColor(Color.black)
                    }
                    .frame(width: 315, height: 60)
                    .background(Color.white)
                    .cornerRadius(20)
                }
                NavigationLink(destination: Text("Faq")) {
                    HStack(spacing: 220) {
                        Text("Faq")
                            .padding(.leading, 5)
                            .foregroundColor(Color.black)
                        Image(systemName: "chevron.right")
                            .padding(.trailing, 5)
                            .foregroundColor(Color.black)
                            
                    }
                    .frame(width: 315, height: 60)
                    .background(Color.white)
                    .cornerRadius(20)
                }
                NavigationLink(destination: Text("Help")) {
                    HStack(spacing: 215) {
                        Text("Help")
                            .padding(.leading, 5)
                            .foregroundColor(Color.black)
                        Image(systemName: "chevron.right")
                            .foregroundColor(Color.black)
                            .padding(.trailing, 5)
                    }
                    .frame(width: 315, height: 60)
                    .background(Color.white)
                    .cornerRadius(20)
                }
            }
        
    }
}
