//
//  HomeView.swift
//  RxSwift
//
//  Created by Mac on 17/10/2023.
//

import SwiftUI

struct HomeView: View {
    @State var isShowingSidebar = false
    var body: some View {
        NavigationView {
            Button(action: {
                withAnimation {
                    isShowingSidebar.toggle()
                }
            }) {
                Image(systemName: "text.alignleft")
                    .font(.title)
            }
            .padding()
        }
    }
}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
