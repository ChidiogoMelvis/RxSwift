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
        
        let customColor = Color(hex: 0xFF460A)
        
        ZStack{
            if self.isActive{
                SignupSigninView()
            } else {
                
                customColor.edgesIgnoringSafeArea(.all)
                VStack {
                    ZStack{
                        Image(uiImage: UIImage(named: "circle")!)
                            .resizable()
                            .aspectRatio(CGSize(width: 60, height: 60), contentMode: .fit)
                            .frame(width: 60, height: 60)
                            .position(x: 50, y: 50)
                        Image(uiImage: UIImage(named: "appLogo")!)
                            .resizable()
                            .aspectRatio(CGSize(width: 50, height: 50), contentMode: .fit)
                            .frame(width: 50, height: 50)
                            .position(x: 50, y: 50)
                    }
        
                }
                
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
