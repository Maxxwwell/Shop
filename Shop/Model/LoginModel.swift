//
//  LoginModel.swift
//  Shop
//
//  Created by Maxwell on 09/02/2024.
//

import Foundation
class LoginModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isEmailValid: Bool = false
    @Published var isValidPassword: Bool = false
    @Published var showPassword: Bool = false

    func validateFields() {
        // Validate email
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        isEmailValid = emailPredicate.evaluate(with: email)
        // Validate password (example: at least 6 characters)
        isValidPassword = password.count >= 6
    }
}
