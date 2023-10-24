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
            HStack {
                MenuContents(presentSidemenu: $presentSidemenu)
                    .padding()
            }
            .frame(width: 250, height: .infinity)
            .background(Color(hex: 0xFA4A0C))
            .padding(.top, 50)
        }
    }
}

struct MenuContents: View {
    @Binding var presentSidemenu: Bool
    
    var body: some View {
        List {
            NavigationLink(destination: Text("Profile")) {
                HStack {
                    Image(systemName: "person.crop.circle")
                        .foregroundColor(Color.black)
                    padding()
                    Text("Profile")
                }
                
            }
            .listRowInsets(EdgeInsets(top: 0, leading: 20, bottom: 50, trailing: 0))
            .listRowSeparator(.hidden)
            
            NavigationLink(destination: Text("Orders")) {
                HStack {
                    Image(systemName: "cart")
                        .foregroundColor(Color.black)
                    padding()
                    Text("Orders")
                }
            }
            .listRowInsets(EdgeInsets(top: 0, leading: 20, bottom: 50, trailing: 0))
            .listRowSeparator(.hidden)
            
            NavigationLink(destination: Text("Offer and Promo")) {
                HStack {
                    Image(systemName: "tag")
                    padding()
                    Text("Offer and Promo")
                }
            }
            .listRowInsets(EdgeInsets(top: 0, leading: 20, bottom: 50, trailing: 0))
            .listRowSeparator(.hidden)
            
            NavigationLink(destination: Text("Privacy policy")) {
                HStack {
                    Image(systemName: "list.dash.header.rectangle")
                        .foregroundColor(Color.black)
                    padding()
                    Text("Privacy policy")
                }
            }
            .listRowInsets(EdgeInsets(top:0, leading: 20, bottom: 50, trailing: 0))
            .listRowSeparator(.hidden)
            
            NavigationLink(destination: Text("Security")) {
                HStack {
                    Image(systemName: "shield.righthalf.filled")
                        .foregroundColor(Color.black)
                    padding()
                    Text("Security")
                }
            }
            .listRowInsets(EdgeInsets(top: 0, leading: 20, bottom: 50, trailing: 0))
            .listRowSeparator(.hidden)
        }
        .listStyle(SidebarListStyle())
        .toolbar {
            ToolbarItem(placement: .navigation) {
            }
        }
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

struct FoodView: View {
    var body: some View {
        Text("Food View")
            .font(.title)
            .padding()
    }
}

struct DrinksView: View {
    var body: some View {
        Text("Drinks View")
            .font(.title)
            .padding()
    }
}

struct SnacksView: View {
    var body: some View {
        Text("Snacks View")
            .font(.title)
            .padding()
    }
}

struct SauceView: View {
    var body: some View {
        Text("Sauce View")
            .font(.title)
            .padding()
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

struct HomeView: View {
    @State var presentSidemenu = false
    @State var selectedTab = 0
    @State var searchText: String = ""
    var body: some View {
        VStack(alignment: .leading) {
            Text("Delicious \nfood for you")
                .padding(.top, 80)
                .padding(.leading, 20)
                .lineLimit(2)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .font(.system(size: 35))
            HStack(alignment: .center) {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                TextField("Search", text: $searchText)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 5)
            }
            .frame(width: 300, height: 30)
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(30)
            .padding()
            ScrollableSegmentedView()
            Spacer()
        }
    }
}


struct HeartView: View {
    var body: some View {
        Color.red
            .edgesIgnoringSafeArea(.all)
        //Text("")
    }
}

struct UserView: View {
    var body: some View {
        Color.brown
            .edgesIgnoringSafeArea(.all)
        //Text("")
    }
}

struct UserHistoryView: View {
    var body: some View {
        Color.pink
            .edgesIgnoringSafeArea(.all)
        //Text("")
    }
}
