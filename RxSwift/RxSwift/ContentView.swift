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

//struct MenuContents: View {
//    @Binding var presentSidemenu: Bool
//
//    var body: some View {
//        List {
//            ZStack {
//                NavigationLink("Profile", destination: Text("Profile"))
//                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
//                    .listRowSeparator(.hidden)
//            }
//            ZStack {
//                NavigationLink("Orders", destination: Text("Orders"))
//                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 50, trailing: 0))
//                    .listRowSeparator(.hidden)
//            }
//            ZStack {
//                NavigationLink("Offer and Promo", destination: Text("Offer and Promo"))
//                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 50, trailing: 0))
//                    .listRowSeparator(.hidden)
//            }
//            ZStack {
//                NavigationLink("Privacy policy", destination: Text("Privacy policy"))
//                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 50, trailing: 0))
//                    .listRowSeparator(.hidden)
//            }
//            ZStack {
//                NavigationLink("Security", destination: Text("Security"))
//                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 50, trailing: 0))
//                    .listRowSeparator(.hidden)
//            }
//        }
//        .listStyle(SidebarListStyle())
//        .toolbar {
//            ToolbarItem(placement: .navigation) {
//            }
//        }
//    }
//}

struct MenuContents: View {
    @Binding var presentSidemenu: Bool

    var body: some View {
        List {
            NavigationLink(destination: Text("Profile")) {
                HStack {
                    Image(uiImage: UIImage(named: "profile")!)
                    Text("Profile")
                }
                
            }
            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
            .listRowSeparator(.hidden)

            NavigationLink(destination: Text("Orders")) {
                HStack {
                    Image(uiImage: UIImage(named: "order")!)
                    Text("Orders")
                }
            }
            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 50, trailing: 0))
            .listRowSeparator(.hidden)

            NavigationLink(destination: Text("Offer and Promo")) {
                HStack {
                    Image(uiImage: UIImage(named: "offer")!)
                    Text("Offer and Promo")
                }
            }
            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 50, trailing: 0))
            .listRowSeparator(.hidden)

            NavigationLink(destination: Text("Privacy policy")) {
                HStack {
                    Image(uiImage: UIImage(named: "privacy")!)
                    Text("Privacy policy")
                }
            }
            .listRowInsets(EdgeInsets(top:0, leading: 0, bottom: 50, trailing: 0))
            .listRowSeparator(.hidden)

            NavigationLink(destination: Text("Security")) {
                HStack {
                    Image(systemName: "security")
                    Text("Security")
                }
            }
            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 50, trailing: 0))
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
                Text("Food")
                    .font(.title)
                    .padding()
            } else if selectedTab == 1 {
                Text("Drinks")
                    .font(.title)
                    .padding()
            } else if selectedTab == 2 {
                Text("Snacks")
                    .font(.title)
                    .padding()
            } else {
                Text("Sauce")
                    .font(.title)
                    .padding()
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
        Text("")
    }
}

struct UserView: View {
    var body: some View {
        Text("")
    }
}

struct UserHistoryView: View {
    var body: some View {
        Text("")
    }
}
