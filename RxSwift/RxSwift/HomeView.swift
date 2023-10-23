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
            
            VStack {
                Spacer()
                ContentView()
                Spacer()
            }
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
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Color.clear
                HStack {
                    MenuContents(presentSidemenu: $presentSidemenu)
                        .background(Color(hex: 0xFA4A0C))
                        .foregroundColor(.red)
                        .padding()
                }
                .frame(width: 250)
                .padding(.top, 50)
            }
            .gesture(
                DragGesture()
                    .onEnded { value in
                        if value.translation.width < -100 {
                            withAnimation {
                                presentSidemenu = false
                            }
                        }
                    }
            )
            .frame(width: geometry.size.width)
        }
    }
}

struct MenuContents: View {
    @Binding var presentSidemenu: Bool
    
    var body: some View {
        List {
            ZStack {
                NavigationLink("Profile", destination: Text("Profile"))
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 50, trailing: 0))
                    .listRowSeparator(.hidden)
            }
            ZStack {
                NavigationLink("Orders", destination: Text("Orders"))
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 50, trailing: 0))
                    .listRowSeparator(.hidden)
            }
            ZStack {
                NavigationLink("Offer and Promo", destination: Text("Offer and Promo"))
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 50, trailing: 0))
                    .listRowSeparator(.hidden)
            }
            ZStack {
                NavigationLink("Privacy policy", destination: Text("Privacy policy"))
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 50, trailing: 0))
                    .listRowSeparator(.hidden)
            }
            ZStack {
                NavigationLink("Security", destination: Text("Security"))
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 50, trailing: 0))
                    .listRowSeparator(.hidden)
            }
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


struct ContentView: View {
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
