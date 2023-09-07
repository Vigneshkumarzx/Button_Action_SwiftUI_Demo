//
//  UserLoginViewModel.swift
//  Button_Action_SwiftUI_Demo
//
//  Created by vignesh kumar c on 07/09/23.
//

import Foundation
import SwiftUI

class UserLoginModel: ObservableObject  {
    @Published  var userName: String = ""
    @Published var password: String = ""
    @Published var isLoggedIn: Bool = false
    
    
    let savedUserName = "Vicky"
    let SavedPassword = "Test@12"
    
    func login() -> Bool {
        print("username is:\(userName)")
        print("password is: \(password)")
        print("SavedUserName is: \(savedUserName)")
        print("SavedPassword is: \(SavedPassword)")
        print("isLoggedIn: \(isLoggedIn)")
        
        if userName == savedUserName && password == SavedPassword {
            isLoggedIn = true
            return true
        } else {
            isLoggedIn = false
            return false
        }
    }
}
