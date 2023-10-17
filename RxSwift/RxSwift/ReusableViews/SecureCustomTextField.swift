//
//  SecureCustomTextField.swift
//  RxSwift
//
//  Created by Mac on 17/10/2023.
//

import SwiftUI

struct SecureCustomTextField: View {
    @Binding var text: String
    var placeholder: String
    var body: some View {
        SecureField(placeholder, text: $text)
            .padding(.horizontal, 16)
            .padding(.bottom, 5)
    }
}

