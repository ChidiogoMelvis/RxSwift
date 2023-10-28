//
//  CustomButton.swift
//  RxSwift
//
//  Created by Mac on 28/10/2023.
//

import SwiftUI

struct CustomButton: View {
    var title: String
    var action: () -> Void
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(Color.white)
                .padding()
                .frame(width: 300, height: 50)
                .background(Color(hex: 0xFA4A0C))
                .cornerRadius(25)
                .frame(width: 300, height: 50)
                .controlSize(.large)
        }
    }
}

