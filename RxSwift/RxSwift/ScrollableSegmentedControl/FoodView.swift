//
//  FoodView.swift
//  RxSwift
//
//  Created by Mac on 25/10/2023.
//

import SwiftUI

struct FoodView: View {
    let imageNames = ["food1","food2","food3","food4"]
    
    var body: some View {
        Color(hex: 0xEDEDED)
            .edgesIgnoringSafeArea(.all)
            .overlay (
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: -50) {
                        ForEach(imageNames, id: \.self) { imageName in
                            Image(imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 220, height: 321)
                        }
                    }
                    .padding(.top, 50)
                }
            )
    }
}


struct FoodView_Previews: PreviewProvider {
    static var previews: some View {
        FoodView()
    }
}
