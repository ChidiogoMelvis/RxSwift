//
//  Button.swift
//  RxSwift
//
//  Created by Mac on 17/10/2023.
//

import SwiftUI

struct CustomButton: View {
    var title: String
    var foregroundColor: Color
    var backgroundColor: Color
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.white)
                .frame(width: 300, height: 50)
                .background(Color(hex: 0xFA4A0C))
                .cornerRadius(25)
                .frame(width: 300, height: 50)
                .controlSize(.large)
                .padding(.horizontal, 40)
        }
    }
}

//struct Button_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomButton(title: "", foregroundColor: Color.clear, backgroundColor: Color.clear, action: )
//    }
//}
