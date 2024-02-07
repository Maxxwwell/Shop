//
//  SplashScreen.swift
//  Shop
//
//  Created by Maxwell on 05/02/2024.
//

import SwiftUI

struct SplashScreen: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        if isActive {
            ContentView()
            
        } else {
            VStack {
                Image("splash")
                    .resizable()
                    .frame(width: 75, height: 75)
//                     Text("Shop")

            }
            .scaleEffect(size)
            .opacity(opacity)
            .onAppear {
                withAnimation(.easeIn(duration: 1.2)) {
                    self.size = 0.9
                    self.opacity = 1.0
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation{
                        self.isActive = true
                    }
                }
            }
        }
    }
}
struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
