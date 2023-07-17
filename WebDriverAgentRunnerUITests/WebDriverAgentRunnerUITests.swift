//
//  WebDriverAgentRunnerUITests.swift
//  WebDriverAgentRunnerUITests
//
//  Created by Technoidentity on 02/02/23.
//

import XCTest
import Accessibility

 class WebDriverAgentRunnerUITests: XCTestCase {
    
   
  

    
    
   //<------------------ start ------------------------------->
    
//   let app = XCUIApplication(bundleIdentifier: "com.sidebench.soflete.staging")
   
    var app : XCUIApplication =  XCUIApplication(bundleIdentifier: "com.sidebench.soflete.dev")
    override func setUpWithError() throws {
        
        app.launch()
       
        
    }
     
    
    override func tearDownWithError() throws {
        // app.terminate()
    }
    
    
    
     
    
    
     func testLogin() throws {
      
         
       print("<--------------Executed---------------->")
         
         
         app.buttons["Next"].tap()
         app.buttons["Next"].tap()
         app.buttons["Sign in"].tap()
         sleep(5)
         
         // Logo, Text elements are presented
         XCTAssert(app.images["SFLT Box"].exists, "Label is presented")
         XCTAssert(app.staticTexts["BECOME A SOFLETE."].exists)
         
         app.textFields.firstMatch.tap()
         app.textFields.firstMatch.typeText("prasadqat12@gmail.com")
         app.buttons["Sign in"].tap()
         sleep(5)
         try testloginThroughGmail(environment: "development")
         
        
                  
                           
                          
                  
         
         
         
         
//
//        app.buttons["Next Button"].tap()
//        try testExampleBnC()
//        let email_Id = app.textFields.firstMatch
//        email_Id.tap()
//        email_Id.typeText("prasadqat12@gmail.com")
//        let signInButton = app.buttons["Sign in"]
//        signInButton.tap()
//        sleep(5)
//        app.images["Mail"].tap()
//        try testloginThroughGmail(environment:"staging")
//        try testloginThroughGmail(environment:"development")
//        try previousGmailLinkDelete_SFLTappLaunch(environment:"staging")
//        try testPreviousGmailLinkDelete_SFLTappLaunch(environment:"development")
//        try testLogout()
       
        
        
    }
     
     
     func testdeletemails() throws {
         
         
         try PreviousGmailLinkDelete_SFLTappLaunch(environment:"development")
                                    
                                    
         
     }
    
    
     func PreviousGmailLinkDelete_SFLTappLaunch(environment:String) throws {
         
         
         var emailSubject:String
         if environment=="development" {
             
             emailSubject = "Sign in to Soflete Development"
             let app = XCUIApplication(bundleIdentifier: "com.google.Gmail")
             app.launch()
             let searchBar = app.staticTexts["kGMDCOpenSearchBarViewPlaceholderAccessibilityIdentifier"]
             let searchBar_exists = searchBar.waitForExistence(timeout: 10)
             XCTAssert(searchBar_exists)
             searchBar.tap()
             let editSearchbar = app.textFields["SearchTextField"]
             let editSearchbar_exists = editSearchbar.waitForExistence(timeout: 5)
             XCTAssert(editSearchbar_exists)
             editSearchbar.tap()
             sleep(5)
             editSearchbar.typeText(emailSubject)
             app.buttons["Search"].tap()
             sleep(5)
             
             
             
             
             
             let noReplyLabel=app.staticTexts.containing(.staticText, identifier: "Sign in to Soflete Development").firstMatch
                   
             sleep(5)
             noReplyLabel.tap()
             app.buttons["CVNavbarDelete"].tap()
             let app1 = XCUIApplication(bundleIdentifier: "com.sidebench.soflete.dev")
             app1.launch()
         }
            
         else if environment=="staging" {
             
             emailSubject="Sign in to Soflete Staging"
             let app = XCUIApplication(bundleIdentifier: "com.google.Gmail")
             app.launch()
             let searchBar = app.staticTexts["kGMDCOpenSearchBarViewPlaceholderAccessibilityIdentifier"]
             let searchBar_exists = searchBar.waitForExistence(timeout: 10)
             XCTAssert(searchBar_exists)
             searchBar.tap()
             let editSearchbar = app.textFields["SearchTextField"]
             let editSearchbar_exists = editSearchbar.waitForExistence(timeout: 5)
             XCTAssert(editSearchbar_exists)
             editSearchbar.tap()
             editSearchbar.typeText(emailSubject)
             app.buttons["Search"].tap()
             let noReplyLabel=app.staticTexts.containing(.staticText, identifier: "Sign in to Soflete Staging").element(boundBy: 1)
             sleep(5)
             noReplyLabel.tap()
             app.buttons["CVNavbarDelete"].tap()
             let app1 = XCUIApplication(bundleIdentifier: "com.sidebench.soflete.staging")
             app1.launch()
             
         }
        
        
        
            
        
    }
    
    
    func testLogout(){

        let settingsBtn = app.buttons["Filled Settings"]
        let settingsBtnExists = settingsBtn.waitForExistence(timeout: 3)
        XCTAssert(settingsBtnExists)
        settingsBtn.tap()
        sleep(5)
        app.staticTexts["PREFERENCES"].swipeUp()
        sleep(2)
        let logout =  app.buttons["Logout"]
        let logoutExists = logout.waitForExistence(timeout: 7)
        XCTAssert(logoutExists)
        logout.tap()
        sleep(3)
        XCTAssert(app.staticTexts["Are you sure you want logout?"].exists)
        //let logoutBtn =  app.buttons.firstMatch
        let logoutBtn = app.buttons.element(boundBy: 0)
        logoutBtn.tap()
        
      



    }
     
     
     
     func testStartCycle(){
         
         app.launch()
         let startCycleBtn=app.buttons["Start Cycle Button"]
         startCycleBtn.tap()
         
         
         
                  
         
         
         
         
     }
     
     
     
    
     
     
     
     
    
    
  
    
    
   
    

     
     
     func testloginThroughGmail(environment: String) throws {
         
         
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
         editSearchbar.typeText(emailSubject)
         
         app.buttons["Search"].tap()
   //      app.waitForExistence(timeout: 5)
         let button = app.buttons["Attachment"]
         button.swipeLeft()
     //    app.waitForExistence(timeout: 5)
         app.buttons["Is unread"].tap()
                 
         
         let noReplyLabel=app.staticTexts.containing(.staticText, identifier: emailSubject).element(boundBy: 1)
         sleep(7)
         noReplyLabel.tap()
         
         let SignInlink=app.links[emailSubject]
    //     let SignInlinkExist = SignInlink.waitForExistence(timeout: 5)
         SignInlink.tap()
         sleep(5)
     }

     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
    
    
    
    
    
    func testTrainingScreen() throws {
        
        
        app.images["SFLT Text"].tap()
        app.buttons["Filled Settings"].tap()
        app.windows.children(matching: .other).element.children(matching: .other).element(boundBy: 1).tap()
        app.navigationBars["_TtGC7SwiftUI19UIHosting"].staticTexts["my_account"].tap()
        
        
        let app = XCUIApplication()
        app/*@START_MENU_TOKEN@*/.scrollViews/*[[".windows[\"SBSwitcherWindow:Main\"]",".otherElements[\"AppSwitcherContentView\"]",".otherElements[\"WebDriverAgentRunner\"].scrollViews",".otherElements[\"card:XCUITest.WebDriverAgentRunner:sceneID:XCUITest.WebDriverAgentRunner-default\"].scrollViews",".scrollViews"],[[[-1,4],[-1,3],[-1,2],[-1,1,2],[-1,0,1]],[[-1,4],[-1,3],[-1,2],[-1,1,2]],[[-1,4],[-1,3],[-1,2]]],[0]]@END_MENU_TOKEN@*/.otherElements.statusBars.staticTexts["12:42 PM"].tap()
        
        let avatarTestImage = app.images["Avatar Test"]
        avatarTestImage.tap()
        avatarTestImage.tap()
        app.images["SFLT Text"].tap()
        
        let filledSettingsButton = app.buttons["Filled Settings"]
        filledSettingsButton.tap()
        
        let element = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element
        element.children(matching: .other).element(boundBy: 0).tap()
        app.navigationBars["_TtGC7SwiftUI19UIHosting"].children(matching: .other).element.tap()
        app/*@START_MENU_TOKEN@*/.scrollViews.containing(.other, identifier:"Vertical scroll bar, 2 pages")/*[[".windows[\"SBCoverSheetWindow\"].scrollViews.containing(.other, identifier:\"Vertical scroll bar, 2 pages\")",".scrollViews.containing(.other, identifier:\"Vertical scroll bar, 2 pages\")"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.children(matching: .other).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element(boundBy: 1).children(matching: .scrollView).element.children(matching: .scrollView).element.tap()
        app/*@START_MENU_TOKEN@*/.otherElements["card:com.sidebench.soflete.dev:sceneID:com.sidebench.soflete.dev-1B57BB22-A19E-43CC-B8AF-54F7EB09F962"].scrollViews/*[[".windows[\"SBSwitcherWindow:Main\"]",".otherElements[\"AppSwitcherContentView\"]",".otherElements[\"Soflete Dev\"].scrollViews",".otherElements[\"card:com.sidebench.soflete.dev:sceneID:com.sidebench.soflete.dev-1B57BB22-A19E-43CC-B8AF-54F7EB09F962\"].scrollViews",".scrollViews"],[[[-1,3],[-1,2],[-1,1,2],[-1,0,1]],[[-1,3],[-1,2],[-1,1,2]],[[-1,4],[-1,3],[-1,2]]],[0]]@END_MENU_TOKEN@*/.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 1).children(matching: .other).element(boundBy: 1).tap()
        filledSettingsButton.tap()
        app.collectionViews/*@START_MENU_TOKEN@*/.buttons["logout"]/*[[".cells.buttons[\"logout\"]",".buttons[\"logout\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.scrollViews/*[[".otherElements[\"are_you_sure_you_want_logout?\"].scrollViews",".scrollViews"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.otherElements.buttons["logout"].tap()
        element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.tap()
        app/*@START_MENU_TOKEN@*/.icons["Gmail"]/*[[".otherElements[\"Home screen icons\"]",".icons.icons[\"Gmail\"]",".icons[\"Gmail\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.buttons["Back"]/*[[".buttons[\"Close\"]",".buttons[\"Back\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["kGMDCOpenSearchBarViewPlaceholderAccessibilityIdentifier"]/*[[".otherElements[\"ListView\"]",".otherElements[\"kGBTOpenSearchBarSearchButtonAccessibilityIdentifier\"]",".staticTexts[\"Search in mail\"]",".staticTexts[\"kGMDCOpenSearchBarViewPlaceholderAccessibilityIdentifier\"]"],[[[-1,3],[-1,2],[-1,1,2],[-1,0,1]],[[-1,3],[-1,2],[-1,1,2]],[[-1,3],[-1,2]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.tables["SearchResultsList"].tables/*[[".otherElements[\"ListView\"]",".tables[\"Empty list\"]",".otherElements[\"SearchSuggestionList\"].tables",".tables",".tables[\"SearchResultsList\"]"],[[[-1,4,2],[-1,1,2],[-1,0,1]],[[-1,4,2],[-1,1,2]],[[-1,3],[-1,2]]],[0,0]]@END_MENU_TOKEN@*/.otherElements["Recent mail searches"].children(matching: .other).element.tap()
        

        

        
        
        
        
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
        func testNavigation() throws {
            
//            let app = XCUIApplication(bundleIdentifier: "com.sidebench.soflete.staging")
//            app.tabBars.buttons["Gym Weight"].tap()
//
//            let settingsIcon = app.staticTexts["SFLT"]
//            XCTAssertEqual(settingsIcon.exists, false)
//
//            app.tabBars.buttons["Kitchen Food"].tap()
//            app.tabBars.buttons["Gym Weight"].tap()
//            app.tabBars.buttons["Cart"].tap()
//
            
            
            
            
//            let app = XCUIApplication()
//            let element = app.windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
//            element.tap()
//
//            let tabBar = app.tabBars["Tab Bar"]
//            let cartButton = tabBar.buttons["Cart"]
//            cartButton.tap()
//
//            let kitchenFoodButton = tabBar.buttons["Kitchen Food"]
//            kitchenFoodButton.tap()
//            tabBar.buttons["Chart-bar"].tap()
//            tabBar.buttons["Three People"].tap()
//            cartButton.tap()
//            cartButton.tap()
//            app/*@START_MENU_TOKEN@*/.otherElements["Home screen icons"].icons["Clock"]/*[[".otherElements[\"Home screen icons\"]",".icons.icons[\"Clock\"]",".icons[\"Clock\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[2,0]]@END_MENU_TOKEN@*/.tap()
//
//            app/*@START_MENU_TOKEN@*/.icons["Soflete Stg"]/*[[".otherElements[\"Home screen icons\"]",".icons.icons[\"Soflete Stg\"]",".icons[\"Soflete Stg\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
//            kitchenFoodButton.tap()
//            cartButton.tap()
//            tabBar.buttons["Gym Weight"].tap()
//            element.tap()
//            let sfltTextImage = app.images["SFLT Text"]
//            sfltTextImage.tap()
//            let avatarTestImage = app.images["Avatar Test"]
//            avatarTestImage.tap()
//            avatarTestImage.tap()
//            sfltTextImage.tap()
//            app.images["Filled Settings"].tap()
//            kitchenFoodButton.tap()
//            avatarTestImage.tap()

            
                        
         
            
                       
                        
            
           

                        
                        

            
            

                                    
            
            
           
           
            
            
//            let elementsQuery = app.scrollViews.otherElements
//            elementsQuery.buttons["LoginViewController.signUpButtonIdentifier"].tap()
//
//            app.navigationBars.buttons["cross icon"].tap()
//
//            let usernameTextField = app.textFields["LoginViewController.userNameTextFieldIdentifier"]
//            usernameTextField.tap()
//            usernameTextField.typeText("mytestusername")
//
//            let passwordTextField = app.secureTextFields["LoginViewController.passwordTextFieldIdentifier"]
//            passwordTextField.tap()
//            passwordTextField.typeText("Testing-123")
//
//            elementsQuery.buttons["LoginViewController.signInButtonIdentifier"].tap()

        }
    
    
    
}
