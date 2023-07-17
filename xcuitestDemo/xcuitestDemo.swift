//
//  xcuitestDemo.swift
//  xcuitestDemo
//
//  Created by Technoidentity on 08/04/23.
//

import XCTest

final class xcuitestDemo: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    
  // < ------------------------------Start from here----------------------------- >
    
    
    
    let app=XCUIApplication(bundleIdentifier: "com.sidebench.soflete.uat")

    func testExample() throws {
       
        app.launch()
        let email_address=app.textFields.firstMatch
        email_address.tap()
        email_address.typeText("prasadqat12@gmail.com")
        
        app.buttons["Sign in"].tap()
        sleep(10)
        let txt=app.staticTexts
        print("labels are: \(txt)")
        
        // XCTAssertEqual(app.staticTexts["MAGIC LINK"].firstMatch,"MAGIC LINK")
        
        
                
        
        
        
        
       
    }

  
}
