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
        HStack {
            
        }
    }
}

struct MenuContents: View {
    var body: some View {
        VStack {
            
        }
    }
}



