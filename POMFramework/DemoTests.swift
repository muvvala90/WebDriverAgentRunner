//
//  DemoTests.swift
//  DemoTests
//
//  Created by Technoidentity on 10/07/23.
//

import XCTest

 class DemoTests: signInScreen {
    
   // add initial commit123 in Github
     // added something
   
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

