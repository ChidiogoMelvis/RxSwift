//
//  HomeView.swift
//  RxSwift
//
//  Created by Mac on 17/10/2023.
//

import SwiftUI

struct HomeView: View {
    @State var presentSidemenu = false
    var body: some View {
        ZStack {
            if presentSidemenu {
                SideMenuView(presentSidemenu: $presentSidemenu)
                    .transition(.move(edge: .leading))
                    .animation(.default)
            }
            Button (action: {
                withAnimation {
                    presentSidemenu.toggle()
                }
            }) {
                Image(systemName: "text.alignleft")
                    .foregroundColor(.blue)
                    .font(.title)
            }
            .padding()
            .position(x: 30, y: 30)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct SideMenuView: View {
    @Binding var presentSidemenu: Bool
    var body: some View {
        ZStack(alignment: .leading) {
            Color.clear
            HStack {
                MenuContents(presentSidemenu: $presentSidemenu)
                    .foregroundColor(.red)
                    .padding()
            }
            .frame(width: 250)
            .background(Color.blue)
        }
        .onTapGesture {
            withAnimation {
                presentSidemenu.toggle()
            }
        }
    }
}

struct MenuContents: View {
    @Binding var presentSidemenu: Bool
    var body: some View {
        List {
            NavigationLink("Profile", destination: Text("Profile"))
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 50, trailing: 0))
                .listRowSeparator(.hidden)
            NavigationLink("Orders", destination: Text("Orders"))
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 50, trailing: 0))
                .listRowSeparator(.hidden)
            NavigationLink("Offer and Promo", destination: Text("Offer and Promo"))
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 50, trailing: 0))
                .listRowSeparator(.hidden)
            NavigationLink("Privacy policy", destination: Text("Privacy policy"))
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 50, trailing: 0))
                .listRowSeparator(.hidden)
            NavigationLink("Security", destination: Text("Security"))
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 50, trailing: 0))
                .listRowSeparator(.hidden)
        }
        .listStyle(SidebarListStyle())
        
        .toolbar {
            ToolbarItem(placement: .navigation) {
                Button(action: {
                    withAnimation {
                        presentSidemenu.toggle()
                    }
                }) {
                    Image(systemName: "text.alignleft")
                }
            }
        }
    }
}




