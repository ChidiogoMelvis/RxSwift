//
//  UserHistoryView.swift
//  RxSwift
//
//  Created by Mac on 25/10/2023.
//

import SwiftUI

struct UserHistoryView: View {
    var body: some View {
        Color.white
            .edgesIgnoringSafeArea(.all)
            .overlay (
        Text("User history")
        )
    }
}

struct UserHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        UserHistoryView()
    }
}
