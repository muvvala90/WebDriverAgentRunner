//
//  WebDriverAgentRunnerUITestsLaunchTests.swift
//  WebDriverAgentRunnerUITests
//
//  Created by Technoidentity on 02/02/23.
//

import XCTest

 class WebDriverAgentRunnerUITestsLaunchTests: WebDriverAgentRunnerUITests  {

//    override class var runsForEachTargetApplicationUIConfiguration: Bool {
//        true
//    }
//
//    override func setUpWithError() throws {
//        continueAfterFailure = false
//    }

    func testLaunch() throws {
        
        
                

                let screenshot = XCUIScreen.main.screenshot()
                let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
                let screenshotURL = documentsDirectory.appendingPathComponent("screenshot.png")
                do {
                    try screenshot.pngRepresentation.write(to: screenshotURL, options: .atomic)
                    print("Screenshot saved to: \(screenshotURL)")

                } catch {
                    print("Failed to save screenshot: \(error)")
                }
        
    }
     
     
     
   
    
    
    
    
   
}
