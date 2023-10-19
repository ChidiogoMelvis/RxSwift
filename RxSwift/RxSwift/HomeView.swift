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
        VStack{
            HStack{
                Button{
                    presentSidemenu.toggle()
                } label: {
                    Image(uiImage: UIImage(systemName: "text.alignleft")!)
                        .resizable()
                        .frame(width: 32, height: 32)
                }
                Spacer()
            }
            
            Spacer()
            Text("Home View")
            Spacer()
        }
        .padding(.horizontal, 24)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct ContentView: View {
    @State var presentSidemenu = false
    var body: some View {
        NavigationView {
            MenuContents()
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
                .navigationTitle("main content")
            if presentSidemenu {
                SideMenuView(presentSidemenu: $presentSidemenu)
                    .frame(width: 250)
            }
        }
    }
}

struct SideMenuView: View {
    @Binding var presentSidemenu: Bool
    var body: some View {
        List {
            NavigationLink("Home", destination: Text("Homeview"))
            NavigationLink("Profile", destination: Text("Profile"))
            NavigationLink("Orders", destination: Text("Orders"))
            NavigationLink("Offer and Promo", destination: Text("Offer and Promo"))
            NavigationLink("Privacy policy", destination: Text("Privacy policy"))
            NavigationLink("Security", destination: Text("Security"))
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

struct MenuContents: View {
    var body: some View {
        Text("Main content goes here")
    }
}




