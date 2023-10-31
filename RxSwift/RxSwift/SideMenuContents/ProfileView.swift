//
//  ProfileView.swift
//  RxSwift
//
//  Created by Mac on 28/10/2023.
//

import SwiftUI

struct ProfileView: View {
//    @State var selectedOptions: [PaymentOptions] = []
//    enum PaymentOptions: String, CaseIterable {
//        case card
//        case bankAccount
//        case paypal
//    }
    
    var body: some View {
        Color(hex: 0xEDEDED)
            .edgesIgnoringSafeArea(.all)
            .overlay (
        VStack {
            Text("Profile")
                .font(.headline)
                .padding()
            VStack(alignment: .leading) {
                Text("Information")
                    .padding(.leading, -30)
                    .foregroundColor(.black)
                    .font(.headline)
                PersonalDetailsView()
                    .padding(.leading, -50)
            }
            
            Text("Payment Method")
                .font(.headline)
                .padding()
           
            PaymentView()
          Spacer()
        }
        )
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

struct PersonalDetailsView: View {
    var body: some View {
        
        HStack {
                Image(systemName: "person.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60, height: 60)
                    .padding(.bottom, 40)
                    .padding()
            VStack(alignment: .leading) {
                Text("Profile name")
                    .foregroundColor(.black)
                    .font(.headline)
                    .padding(.bottom, 10)
                    .padding(.trailing, 50)
                Text("email address")
                    .foregroundColor(.gray)
                    .font(.body)
                    .padding(.bottom, 10)
                Text("Residential address")
                    .foregroundColor(.gray)
                    .font(.body)
                    .padding(.bottom, 10)
                    .padding(.trailing, 50)
            }
        }
        .background(Color.white)
        .cornerRadius(20)
        .padding()
    }
}

struct PaymentView: View {
    @State var selectedOptions: PaymentOptions?

    enum PaymentOptions: String, CaseIterable {
        case card
        case bankAccount
        case paypal
    }
    var body: some View {
    VStack {
            ForEach(PaymentOptions.allCases, id: \.self) { option in
                Button(action: {
                  selectedOptions = option
                }) {
                    HStack {
                        Image(systemName: option == selectedOptions ? "circle.circle.fill" : "circle")
                            .resizable()
                            .foregroundColor(Color(hex: 0xFA4A0C))
                            .frame(width: 30, height: 30)
                        Text(option.rawValue.capitalized)
                            .foregroundColor(.black)
                    }
                }
            }
            if let selectedOptions = selectedOptions {
                Text("\(selectedOptions.rawValue.capitalized)")
                    .font(.headline)
            }
        }
    }
}

//struct PaymentOptionRow: View {
//    let option: PaymentOptions
//    @Binding var isSelected: Bool
//    var body: some View {
//        HStack {
//            Toggle(isOn: $isSelected) {
//                Text(option.rawValue.capitalized)
//            }
//            Image(systemName: isSelected ? "checkmark.circle.fill" : "circle")
//                .resizable()
//                .frame(width: 30, height: 30)
//        }
//    }
//}
