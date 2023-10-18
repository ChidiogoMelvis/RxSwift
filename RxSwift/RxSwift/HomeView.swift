//
//  HomeView.swift
//  RxSwift
//
//  Created by Mac on 17/10/2023.
//

import SwiftUI

struct HomeView: View {
    //@State var isShowingSidebar = false
@State var presentSideMenu = false
    var body: some View {
        NavigationView {
            VStack{
                HStack {
                    Button {
                        presentSideMenu.toggle()
                    } label: {
                        Image(systemName: "text.alignleft")
                            .resizable()
                            .frame(width: 25, height: 20)
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
}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

