//
//  FoodView.swift
//  RxSwift
//
//  Created by Mac on 25/10/2023.
//

import SwiftUI

struct FoodView: View {
    let foodItem: FoodItem
    let columns = [GridItem(.flexible())]
    var body: some View {
        Color(hex: 0xEDEDED)
            .edgesIgnoringSafeArea(.all)
            .overlay (
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: columns, spacing: 20) {
                        ForEach(0..<10, id: \.self) { index in
                            NavigationLink(destination: FoodMenuView(foodItem: foodItem)) {
                                Color.orange
                                    .frame(width: 200, height: 300)
                            }
                        }
                    }
                    .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
                }
            )
    }
}


struct FoodView_Previews: PreviewProvider {
    static var previews: some View {
        FoodView(foodItem: FoodItem(image: UIImage(named: "food1")!, name: "", price: 0.1, deliveryInfo: "", returnPolicyInfo: ""))
    }
}

struct FoodMenuView: View {
    let foodItem: FoodItem
    var body: some View {
        VStack {
            
        }
    }
}


struct FoodItem {
    let image: UIImage
    let name: String
    let price: Double
    let deliveryInfo: String
    let returnPolicyInfo: String
}
