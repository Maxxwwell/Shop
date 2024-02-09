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
    @State private var isEmailValid: Bool = false
    @State private var isValidPassword: Bool = false
    @State private var showPassword: Bool = false

        
    var body: some View {
        
        VStack {
            
            NavigationStack {
                VStack(alignment: .leading, spacing: 0) {
                    TextField("email", text: $email)
                                        .padding()
                                        .autocapitalization(.none)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 14)
                                                .stroke(Color.gray, lineWidth: 1)
                                        )
                                    .padding(.horizontal)
                                    .onChange(of: email, perform: { newValue in
                                                      validateEmail(newValue)
                                                  })
                    if !isEmailValid && !email.isEmpty {
                                   Text("Invalid email")
                                       .foregroundColor(.red)
                                       .padding(.horizontal, 20)
                                       .padding(.top, 10)
                                       .font(.caption)
                               }
                            }
                
                VStack (alignment: .leading, spacing: 0){
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
                                                .padding(.vertical, 10)
                                                .onChange(of: password, perform: { newValue in
                                                    validatePassword(newValue)
                                                })

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
                                                    .onChange(of: password, perform: { newValue in
                                                        validatePassword(newValue)
                                                    })

                                                  
                        }
                        
                        

                        Button(action: {
                            showPassword = !showPassword
                        }){
                            Image(systemName: showPassword ? "eye" : "eye.slash")
                                .foregroundColor(.black)
                        }
                            .padding(.horizontal, 25)
                    }
                    if !isValidPassword && !password.isEmpty {
                                 Text("Password must be at least 6 characters")
                                     .foregroundColor(.red)
                                     .padding(.horizontal, 20)
                                     .padding(.top, 0)
                                     .font(.caption)
                                     .padding(.top, 5)
                             }

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
                    .padding(.vertical)
                
                                
                Button(action: {
                    print("email is\(email)")
                    print("password \(password)")

                }){
                    Text("Log In")
                        .frame(maxWidth: .infinity, maxHeight: 48)
                        .font(.body)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .background(Constants.appColors.appBlack)
                        .cornerRadius(8)
                } .disabled(!isEmailValid || !isValidPassword)

                    .padding(.horizontal, 20)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
  
    private func validateEmail(_ email: String) {
        // Validate email
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        isEmailValid = emailPredicate.evaluate(with: email)
    }

    private func validatePassword(_ password: String) {
        // Validate password (example: at least 6 characters)
        isValidPassword = password.count >= 6
    }


}


struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
