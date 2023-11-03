//
//  HeartView.swift
//  RxSwift
//
//  Created by Mac on 25/10/2023.
//

import SwiftUI

struct FavoritesView: View {
    var body: some View {
        Color.white
            .edgesIgnoringSafeArea(.all)
            .overlay (
        Text("Favorites")
        )
    }
}

struct HeartView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
