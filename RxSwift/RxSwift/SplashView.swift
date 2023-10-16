//
//  ContentView.swift
//  RxSwift
//
//  Created by Mac on 14/10/2023.
//

import SwiftUI

struct SplashView: View {
    
    @State var isActive: Bool = false
    
    var body: some View {
        
        let customColor = Color(hex: 0xFF4B3A)
        
        ZStack{
            if self.isActive{
                SignupLoginView()
            } else {
                
                customColor.edgesIgnoringSafeArea(.all)
                VStack(alignment: .leading) {
                    ZStack{
                        Image(uiImage: UIImage(named: "circle")!)
                            .resizable()
                            .aspectRatio(CGSize(width: 60, height: 60), contentMode: .fit)
                            .position(x: 150, y: 50)
                            .frame(width: 60, height: 60)
                        Image(uiImage: UIImage(named: "appLogo")!)
                            .resizable()
                            .aspectRatio(CGSize(width: 50, height: 50), contentMode: .fit)
                            .position(x: 150, y: 50)
                            .frame(width: 50, height: 50)
                        
                    }
                    .padding(.bottom, 40)
                    Text("Food for \nEveryone")
                        .position(x: 230, y: 50)
                        .lineLimit(2)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .font(.system(size: 50))
                    HStack {
                        Spacer()
                        Image(uiImage: UIImage(named: "iconLogo2")!)
                            .resizable()
                            .frame(width: 340, height: 430)
                            .offset(x: 50)
                            .zIndex(1)
                        Image(uiImage: UIImage(named: "iconLogo1")!)
                            .resizable()
                            .frame(width: 220, height: 290)
                            .offset(x: -70)
                    }
                    .padding(.bottom, 30)
                    Button(action: {
                        //("btn tapped")
                    }) {
                       Text("Get started")
                            .font(.system(size: 20, weight: .heavy))
                            .foregroundColor(.orange)
                            .padding(.horizontal, 20)
                            .frame(width: 300, height: 50)
                            .background(Color.white)
                            .cornerRadius(25)
                            .position(x: 280)
                            .frame(width: 300, height: 50)
                            .controlSize(.large)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
            }
            
        }
        .onAppear() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
    
    struct SplashView_Previews: PreviewProvider {
        static var previews: some View {
            SplashView()
        }
    }
}
