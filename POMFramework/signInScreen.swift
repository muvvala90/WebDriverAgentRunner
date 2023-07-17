//
//  signInScreen.swift
//  POMFramework
//
//  Created by Technoidentity on 10/07/23.
//

import Foundation
import XCTest

class signInScreen : Baseclass {
    
    
    private lazy var sfltLogo=app.images["SFLT Box"]
    private lazy var title=app.staticTexts["BECOME A SOFLETE."]
    private lazy var emailId=app.textFields.firstMatch
    private lazy var signInBtn=app.buttons["Sign in"]
    
    
    
    func login(text:String){
        
        XCTAssert(sfltLogo.exists)
        XCTAssert(title.exists)
        XCTAssert(emailId.exists)
        XCTAssert(signInBtn.exists)
        
        emailId.tap()
        emailId.typeText(text)
        signInBtn.tap()
       
        
    }
    
    
    
    
    
    
}
