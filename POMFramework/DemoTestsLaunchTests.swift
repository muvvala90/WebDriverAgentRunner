//
//  DemoTestsLaunchTests.swift
//  DemoTests
//
//  Created by Technoidentity on 10/07/23.
//

import XCTest

class DemoTestsLaunchTests: Baseclass {

   

    func testLaunch() throws {
       

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
    
}
