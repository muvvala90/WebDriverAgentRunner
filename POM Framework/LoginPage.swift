//
//  LoginPage.swift
//  xcuitestDemo
//
//  Created by Technoidentity on 19/04/23.
//

import XCTest

class LoginPage {
    
    static let app = XCUIApplication(bundleIdentifier: "com.sidebench.soflete.dev")
    let emailTextField = LoginPage.app.textFields.firstMatch
    let signInButton = LoginPage.app.buttons["Sign in"]
    
    
     static func setUpWithError() throws {
        
        app.launch()
        
    }
    
    
    func testLogin() throws{
       
       
        emailTextField.tap()
        emailTextField.typeText("prasadqat12@gmail.com")
        signInButton.tap()
        
       
    }
    
    
   
    
    
    
    
    
    
    
}

