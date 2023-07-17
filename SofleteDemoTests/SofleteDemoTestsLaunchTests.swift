//
//  SofleteDemoTestsLaunchTests.swift
//  SofleteDemoTests
//
//  Created by Technoidentity on 29/06/23.
//

import XCTest

final class SofleteDemoTestsLaunchTests: XCTestCase {



    func testScreenshot() throws {
        
        let app = XCUIApplication(bundleIdentifier: "com.sidebench.soflete.dev")
        let email_Id = app.descendants(matching: .textField).firstMatch
        email_Id.tap()
        email_Id.typeText("prasadqat12@gmail.com")
        let signInButton = app.buttons["sign_in"]
        signInButton.tap()
        sleep(5)
        app.images["Mail"].tap()
        app.images["Mail"].tap()
        let screenshot = XCUIScreen.main.screenshot()
        let attachment = XCTAttachment(screenshot: screenshot)
        attachment.name = "MyScreenshot"
        attachment.lifetime = .keepAlways
        add(attachment)
        
       
        
    }
}
