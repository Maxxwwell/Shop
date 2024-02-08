//
//  LoginScreen.swift
//  Shop
//
//  Created by Maxwell on 07/02/2024.
//

import SwiftUI

struct LoginScreen: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isValidEmail: Bool = false
    @State private var isValidPassword: Bool = false
    @State private var showPassword: Bool = false

    
    var body: some View {
        
        VStack {
            NavigationStack {
                
                TextField("email", text: $email)
                                    .padding()
                                    .autocapitalization(.none)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 14)
                                            .stroke(Color.gray, lineWidth: 1)
                                    )
                                    .padding(.horizontal)

                ZStack(alignment: .trailing){
                    
                    if showPassword {
                        TextField("password", text: $password)
                                            .padding()
                                            .autocapitalization(.none)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 14)
                                                    .stroke(Color.gray, lineWidth: 1)
                                            )
                                            .padding(.horizontal)
                                            .padding(.vertical)
                    }
                        else {
                            SecureField("password", text: $password)
                                                .padding()
                                                .autocapitalization(.none)
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 14)
                                                        .stroke(Color.gray, lineWidth: 1)
                                                )
                                                .padding(.horizontal)
                                                .padding(.vertical)

                    }
                    

                    Button(action: {
                        print("max")
                        showPassword = !showPassword
                    }){
                        Image(systemName: showPassword ? "eye" : "eye.slash")
                            .foregroundColor(.black)
                    }
                        .padding(.horizontal, 20)
                }


                
                HStack(){
                    Text("")
                    Spacer()
                    Text("")
                    Spacer()
                    NavigationLink( destination: ForgotPassword()) {
                        Text("Forgot Password?")
                            .foregroundColor(Constants.appColors.appBlack)
                        
                    }
                    
                }.padding(.horizontal)
                
                                
                Button(action: {
                    print("max")
                }){
                    Text("Log In")
                        .frame(maxWidth: .infinity, maxHeight: 48)
                        .font(.body)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .background(Constants.appColors.appBlack)
                        .cornerRadius(8)
                }
                    .padding(.horizontal, 20)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}


struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
