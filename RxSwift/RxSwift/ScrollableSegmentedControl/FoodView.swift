//
//  FoodView.swift
//  RxSwift
//
//  Created by Mac on 25/10/2023.
//

import SwiftUI

struct FoodView: View {
    let images: [Image] = [Image(uiImage: UIImage(named: "food1")!), Image(uiImage: UIImage(named: "food2")!), Image(uiImage: UIImage(named: "food3")!), Image(uiImage: UIImage(named: "food4")!) ]
    var body: some View {
        Text("Food View")
            .font(.title)
            .padding()
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

