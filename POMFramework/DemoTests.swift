//
//  DemoTests.swift
//  DemoTests
//
//  Created by Technoidentity on 10/07/23.
//

import XCTest

 class DemoTests: signInScreen {
       
    var wt=WalkThroughs()
    func testExample() throws {
       
        wt.walkthroughsNavigation()
        login(text: "prasadqat12@gmail.com")
        try loginThroughGmail(environment: "development")
    }

     
     func testExample1() throws {
         wt.walkthroughsNavigation()
         login(text: "prasadqat12@gmail.com")
         try loginThroughGmail(environment: "staging")
     }
    
}

