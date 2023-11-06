//
//  FoodView.swift
//  RxSwift
//
//  Created by Mac on 25/10/2023.
//

import SwiftUI

struct FoodView: View {
   // let imageNames = ["food1","food2","food3","food4"]
    
    var body: some View {
        Color(hex: 0xEDEDED)
            .edgesIgnoringSafeArea(.all)
            .overlay (
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(0..<10, id: \.self) { index in
                            Color.orange
                                //.resizable()
//                                .aspectRatio(contentMode: .fit)
                                .frame(width: 200, height: 300)
                        }
                    }
                    .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
                }
            )
    }
}


struct FoodView_Previews: PreviewProvider {
    static var previews: some View {
        FoodView()
    }
}
