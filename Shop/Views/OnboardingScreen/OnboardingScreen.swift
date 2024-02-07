//
//  OnboardingScreen.swift
//  Shop
//
//  Created by Maxwell on 05/02/2024.
//

import SwiftUI
struct OnboardingScreen: View {
    
    @State private var index = 0
    var body: some View {
        NavigationStack {
            VStack {
                
                HStack {
                    Spacer()
                    
                        Rectangle()
                        .frame(width: 50, height: 20)
                        .foregroundColor(.clear)

                    Spacer()
                    Spacer()

                    ZStack {
                        ForEach(0 ..< onboardItems.count, id: \.self) {item in
                            Text(onboardItems[index].tag)
                                .font(.caption)
                                .fontWeight(.bold)
                                .padding(.horizontal)
                                .padding(.vertical, 8)
                                .foregroundColor(.white)
                                .background(onboardItems[item].color)
                                .cornerRadius(8)
                                .opacity(item == index ? 1 : 0)
                                .scaleEffect(item == index ? 1 : 0)
                                .animation(.easeIn, value: item == index)
                        }
                    }
                    Spacer()

                    Spacer()
                    
                    if index < 2 { NavigationLink( destination: LoginScreen()) {
                        Text("Skip")
                            .font(.body)
                            .foregroundColor(.black)
                            .frame(width: 50, height: 20)
                    }
                    } else { Rectangle()
                            .frame(width: 50, height: 20)
                            .foregroundColor(.clear)
                    }
                    Spacer()
            
                }
                
                
                TabView(selection: $index) {
                    ForEach(0 ..< 3) {item in
                        Image("walkthrough_\(item)")
                            .resizable()
                            .aspectRatio(1, contentMode: .fit)
                            .frame(width: 300, height: 250)
                        //                          .frame(width: UIScreen.main.bounds.width / 1.4)
                        
                    }
                } .tabViewStyle(PageTabViewStyle())
                
                HStack(spacing: 5) {
                    ForEach(0 ..< 3) { item in
                        Constants.appColors.appPrimary
                            .opacity(item == index ? 1 : 0.5)
                            .frame(width:item == index ? 18 : 8, height: 8)
                            .animation(.easeIn(duration: 0.4), value: item == index)
                        
                    }
                }
                
                ZStack {
                    ForEach(0 ..< 3) { item in
                        VStack {
                            Text(onboardItems[index].title)
                                .font(.largeTitle)
                            Text(onboardItems[index].description)
                                .multilineTextAlignment(.center)
                                .opacity(0.6)
                                .padding()
                            
                            if index == 2 {
                                
                                NavigationLink(destination: LoginScreen()) {
//                                    Button {} label: {
                                        Text("Get started")
                                            .frame(maxWidth: .infinity, maxHeight: 48)
                                            .background(Constants.appColors.appPrimary)
                                            .foregroundColor(.white)
                                            .cornerRadius(8)
//                                    }
                                    .padding()
                                }
                                
                            } else {
                                Rectangle()
                                    .padding()
                                    .foregroundColor(.clear)
                                    .frame(width: 200, height: 80)
                            }
                                
                        }
                        .opacity(item == index ? 1 : 0)
    //                    .offset(CGSize(width: 0, height: item == index ? 0 : 50 ))
                        .animation(.easeIn, value: item == index)

                    }
                }
            }


        }
                           
    }
}

struct OnboardingScreen_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingScreen()
    }
}
