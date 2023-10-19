//
//  HomeView.swift
//  RxSwift
//
//  Created by Mac on 17/10/2023.
//

import SwiftUI

struct HomeView: View {
    
    @State var presentSideMenu = false
    
    var body: some View {
        VStack{
            HStack{
                Button{
                    presentSideMenu.toggle()
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

struct SideMenu: View {
    var body: some View {
        List {
            NavigationLink("Home", destination: HomeView())
            NavigationLink("Profile", destination: Text("Profile"))
            NavigationLink("Orders", destination: Text("Orders"))
            NavigationLink("Offer and Promo", destination: Text("Offer and Promo"))
            NavigationLink("Privacy policy", destination: Text("Privacy policy"))
            NavigationLink("Security", destination: Text("Security"))
        }
        .listStyle(SidebarListStyle())
    }
}

struct MenuContents: View {
    var body: some View {
        VStack {
            
        }
    }
}



