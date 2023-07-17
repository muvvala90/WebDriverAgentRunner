//
//  Baseclass.swift
//  DemoTests
//
//  Created by Technoidentity on 10/07/23.
//

import Foundation
import XCTest

 class Baseclass: XCTestCase
{
    var app : XCUIApplication =  XCUIApplication(bundleIdentifier: "com.sidebench.soflete.dev")
    override func setUpWithError() throws {
        app.launch()
    }

    override func tearDownWithError() throws {
        app.terminate()
    }
     
     
    // login with gmail
     
     
     func loginThroughGmail(environment: String) throws {
         
         
         let app = XCUIApplication(bundleIdentifier: "com.google.Gmail")
         app.launch()
         var emailSubject: String
         if environment == "development" {
             emailSubject = "Sign in to Soflete Development"
    
         } else if environment == "staging" {
             emailSubject = "Sign in to Soflete Staging"
         } else {
             print("Invalid environment specified")
             return
         }
         print("Email subject is /(emailSubject)")
         let searchBar = app.staticTexts["kGMDCOpenSearchBarViewPlaceholderAccessibilityIdentifier"]
         let searchBarExists = searchBar.waitForExistence(timeout: 5)
         XCTAssert(searchBarExists)
         searchBar.tap()
         let editSearchbar = app.textFields["SearchTextField"]
         let editSearchbarExists = editSearchbar.waitForExistence(timeout: 5)
         XCTAssert(editSearchbarExists)
         editSearchbar.tap()
         sleep(2)
         editSearchbar.typeText(emailSubject)
         
         app.buttons["Search"].tap()
   //      app.waitForExistence(timeout: 5)
         let button = app.buttons["Attachment"]
         button.swipeLeft()
         //app.waitForExistence(timeout: 5)
         sleep(3)
         app.buttons["Is unread"].tap()
         sleep(2)
         
         let noReplyLabel=app.staticTexts.containing(.staticText, identifier: emailSubject).element(boundBy: 1)
         sleep(7)
         noReplyLabel.tap()
         
         
        // let SignInlink=app.links[emailSubject]
         let SignInlink=app.links["Sign in to Soflete Development"]
    //     let SignInlinkExist = SignInlink.waitForExistence(timeout: 5)
         SignInlink.tap()
         sleep(5)
         
         
         
         
     }
    
    
    
    
}







