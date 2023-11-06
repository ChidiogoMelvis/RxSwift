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
                VStack {
                    Text("History")
                        .font(.headline)
                        .padding()
                    Spacer()
                    
                    CustomButton(title: "Start ordering") {
                        
                    }
                    .padding()
                }
            )
    }
}

struct UserHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        UserHistoryView()
    }
}
