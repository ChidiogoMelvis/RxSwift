//
//  TextField.swift
//  RxSwift
//
//  Created by Mac on 17/10/2023.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var email: String
    var placeholder: String
    var body: some View {
        TextField(placeholder, text: $email)
            .padding(.horizontal, 16)
            .padding(.bottom, 5)
    }
}


