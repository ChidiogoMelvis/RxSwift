//
//  HomeView.swift
//  RxSwift
//
//  Created by Mac on 25/10/2023.
//

import SwiftUI

struct HomeView: View {
        @State var presentSidemenu = false
        @State var selectedTab = 0
        @State var searchText: String = ""
        var body: some View {
            Color(hex: 0xEDEDED)
                .edgesIgnoringSafeArea(.all)
                .overlay (
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
            )
        }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
