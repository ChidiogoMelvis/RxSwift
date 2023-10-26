//
//  FoodView.swift
//  RxSwift
//
//  Created by Mac on 25/10/2023.
//

import SwiftUI

struct FoodView: View {
    let imageNames = ["food1", "food2", "food3", "food4"]

        var body: some View {
            ScrollView(.horizontal) {
                LazyHGrid(rows:
                    [GridItem(.flexible(minimum: 200, maximum: 200)),
                    ], spacing: -200) {
                    ForEach(imageNames, id: \.self) { imageName in
                        Image(imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 220, height: 321)
                    }
                }
                .padding(.top, 50)
            }
        }
}

struct FoodView_Previews: PreviewProvider {
    static var previews: some View {
        FoodView()
    }
}

struct ImageItemView: View {
    let imageName: String
    
    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 100, height: 100)
    }
}

