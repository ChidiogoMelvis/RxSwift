//
//  HomeView.swift
//  RxSwift
//
//  Created by Mac on 17/10/2023.
//

import SwiftUI

struct ContentView: View {
    @State var presentSidemenu = false
    @State var selectedTab = 0
    
    var body: some View {
        NavigationView {
            ZStack {
                if presentSidemenu {
                    SideMenuView(presentSidemenu: $presentSidemenu)
                        .transition(.move(edge: .leading))
                        .animation(.default)
                }
                
                TabBarView(selectedTab: $selectedTab)
                    .opacity(presentSidemenu ? 0 : 1)
                
                if !presentSidemenu {
                    Button(action: {
                        withAnimation {
                            presentSidemenu.toggle()
                        }
                    }) {
                        Image(systemName: "text.alignleft")
                            .foregroundColor(.black)
                            .font(.title)
                    }
                    .position(x: 30, y: 20)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SideMenuView: View {
    @Binding var presentSidemenu: Bool
    
    var body: some View {
        ZStack(alignment: .leading) {
            Color.clear
            Button(action: {
                withAnimation {
                    presentSidemenu.toggle()
                }
            }) {
                Image(systemName: "xmark")
                    .foregroundColor(.black)
                    .font(.title)
                    .position(x: 100, y: 100)
            }
            HStack(alignment: .bottom, spacing: 40) {
                MenuContents(presentSidemenu: $presentSidemenu)
                    .padding(.top, 100)
            }
            .frame(width: 250, height: 850)
            .background(Color(hex: 0xFA4A0C))
            .padding(.top)
        }
    }
}

struct MenuContents: View {
    @Binding var presentSidemenu: Bool
    
    var body: some View {
        List {
            NavigationLink(destination: Text("Profile"))
            {
                HStack {
                    Image(systemName: "person.crop.circle")
                        .foregroundColor(Color.white)
                        .padding()
                    Text("Profile")
                        .foregroundColor(Color.white)
                        .fixedSize(horizontal: true, vertical: false)
                }

            }
            .listRowInsets(EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0))
            .listRowBackground(Color(hex: 0xFA4A0C))
            .listRowSeparatorTint(Color.white)
            .padding([.trailing], -30.0)
            
            NavigationLink(destination: Text("Orders")) {
                HStack {
                    Image(systemName: "cart")
                        .foregroundColor(Color.white)
                        .padding()
                    Text("Orders")
                        .foregroundColor(Color.white)
                        .fixedSize(horizontal: true, vertical: false)
                }
            }
            .listRowInsets(EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0))
            .listRowBackground(Color(hex: 0xFA4A0C))
            .listRowSeparatorTint(Color.white)
            .padding([.trailing], -30.0)
            
            NavigationLink(destination: Text("Offer and Promo")) {
                HStack {
                    Image(systemName: "tag")
                        .foregroundColor(Color.white)
                        .padding()
                    Text("Offer and Promo")
                        .foregroundColor(Color.white)
                        .fixedSize(horizontal: true, vertical: false)
                }
            }
            .listRowInsets(EdgeInsets(top: 20, leading: 0, bottom: 2, trailing: 0))
            .listRowBackground(Color(hex: 0xFA4A0C))
            .listRowSeparatorTint(Color.white)
            .padding([.trailing], -30.0)
            
            NavigationLink(destination: Text("Privacy policy")) {
                HStack {
                    Image(systemName: "list.dash.header.rectangle")
                        .foregroundColor(Color.white)
                        .padding()
                    Text("Privacy policy")
                        .foregroundColor(Color.white)
                        .fixedSize(horizontal: true, vertical: false)
                }
            }
            .listRowInsets(EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0))
            .listRowBackground(Color(hex: 0xFA4A0C))
            .listRowSeparatorTint(Color.white)
            .padding([.trailing], -30.0)
            
            NavigationLink(destination: Text("Security")) {
                HStack {
                    Image(systemName: "shield.righthalf.filled")
                        .foregroundColor(Color.white)
                        .padding()
                    Text("Security")
                        .foregroundColor(Color.white)
                        .fixedSize(horizontal: true, vertical: false)
                }
            }
            .listRowInsets(EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0))
            .listRowBackground(Color(hex: 0xFA4A0C))
            .listRowSeparatorTint(Color.white)
            .padding([.trailing], -30.0)
        }
        .listStyle(SidebarListStyle())
        .toolbar {
            ToolbarItem(placement: .navigation) {
            }
        }
        .scrollContentBackground(.hidden)
    }
}

struct SegmentedControlView: View {
    @Binding var selectedTab: Int
    let segmentNames: [String]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 50) {
                ForEach(0..<segmentNames.count, id: \.self) { index in
                    Text(segmentNames[index])
                        .font(.headline)
                        .padding(10)
                        .foregroundColor(selectedTab == index ? Color(hex: 0xFA4A0C) : .gray)
                        .cornerRadius(10)
                        .onTapGesture {
                            selectedTab = index
                        }
                }
            }
            .padding(10)
        }
    }
}

struct ScrollableSegmentedView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        VStack {
            SegmentedControlView(selectedTab: $selectedTab, segmentNames: ["Food", "Drinks", "Snacks", "Sauce"])
            
            if selectedTab == 0 {
                FoodView()
            } else if selectedTab == 1 {
                DrinksView()
            } else if selectedTab == 2 {
                SnacksView()
            } else {
                SauceView()
            }
        }
    }
}

struct TabBarView: View {
    @Binding var selectedTab: Int
    var body: some View {
        TabView {
            HomeView()
                .tag(0)
                .tabItem {
                    Image(uiImage: UIImage(named: "home")!)
                        .foregroundColor(selectedTab == 0 ? Color(hex: 0xFA4A0C) : .gray)
                }
            HeartView()
                .tabItem {
                    Image(uiImage: UIImage(named: "heart")!)
                }
            UserView()
                .tabItem {
                    Image(uiImage: UIImage(named: "user")!)
                }
            UserHistoryView()
                .tabItem {
                    Image(uiImage: UIImage(named: "userHistory")!)
                }
        }
        .accentColor(Color(hex: 0xFA4A0C))
    }
}
