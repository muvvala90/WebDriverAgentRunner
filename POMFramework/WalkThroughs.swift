//
//  WalkThroughs.swift
//  POMFramework
//
//  Created by Technoidentity on 10/07/23.
//

import Foundation

class WalkThroughs: Baseclass
{
    
    
    
    
    private lazy var nextBtn = app.buttons["Next"]
    
    private lazy var signInBtn = app.buttons["Sign in"]
    
    func walkthroughsNavigation(){
        
        
        nextBtn.tap()
        nextBtn.tap()
        signInBtn.tap()
        sleep(5)
        
        
    }
    
    
    
    
}
