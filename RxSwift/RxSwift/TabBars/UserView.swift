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
                        .padding(.leading, -50)
                    UserContents()
                        .padding(.top, -30)
                    //.padding(.bottom, 100)
                    CustomButton(title: "Update") {
                        print("")
                    }
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
        List {
            NavigationLink(destination: Text("Orders"))
            {
                HStack {
                    Text("Orders")
                        .foregroundColor(Color.black)
                        .fixedSize(horizontal: true, vertical: false)
                    Divider()
                }
                
            }
            .listRowSeparator(.visible)
            .listRowInsets(EdgeInsets(top: 20, leading: 20, bottom: 30, trailing: 30))
            
            NavigationLink(destination: Text("Pending reviews")) {
                HStack {
                    Text("Pending reviews")
                        .foregroundColor(Color.black)
                        .fixedSize(horizontal: true, vertical: false)
                    Divider()
                }
            }
            .listRowSeparator(.visible)
            .listRowInsets(EdgeInsets(top: 20, leading: 20, bottom: 30, trailing: 30))
            
            NavigationLink(destination: Text("Faq")) {
                HStack {
                    Text("Faq")
                        .foregroundColor(Color.black)
                        .fixedSize(horizontal: true, vertical: false)
                    Divider()
                }
            }
            .listRowSeparator(.visible)
            .listRowInsets(EdgeInsets(top: 20, leading: 20, bottom: 30, trailing: 30))
            
            NavigationLink(destination: Text("Help")) {
                HStack {
                    Text("Help")
                        .foregroundColor(Color.black)
                        .fixedSize(horizontal: true, vertical: false)
                    Divider()
                }
            }
            .listRowSeparator(.visible)
            .listRowInsets(EdgeInsets(top: 20, leading: 20, bottom: 30, trailing: 30))
        }
        .toolbar {
            ToolbarItem(placement: .navigation) {
            }
        }
    }
}
