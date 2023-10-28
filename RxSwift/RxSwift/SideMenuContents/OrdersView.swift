//
//  OrdersView.swift
//  RxSwift
//
//  Created by Mac on 28/10/2023.
//

import SwiftUI

struct OrdersView: View {
    var body: some View {
        VStack {
            Text("Orders")
                .font(.headline)
                .padding()
          Spacer()
            
            CustomButton(title: "Start ordering") {
                
            }
            .padding()
        }
    }
}

struct OrdersView_Previews: PreviewProvider {
    static var previews: some View {
        OrdersView()
    }
}
