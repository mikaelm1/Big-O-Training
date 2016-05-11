//
//  AnimationEngine.swift
//  Big O Training
//
//  Created by Mikael Mukhsikaroyan on 5/11/16.
//  Copyright © 2016 MSquaredmm. All rights reserved.
//

import UIKit
import pop

class AnimationEngine {
    
    class var offScreenRightPosition: CGPoint {
        return CGPointMake(UIScreen.mainScreen().bounds.width, CGRectGetMidY(UIScreen.mainScreen().bounds))
    }
    
    class var offScreenLeftPosition: CGPoint {
        return CGPointMake(-UIScreen.mainScreen().bounds.width, CGRectGetMidY(UIScreen.mainScreen().bounds))
    }
    
    class var screenCenterPosition: CGPoint {
        return CGPointMake(CGRectGetMidX(UIScreen.mainScreen().bounds), CGRectGetMidY(UIScreen.mainScreen().bounds))
    }
    
    class func animateToPosition(view: UIView, position: CGPoint, completionBlock: ((POPAnimation!, Bool) -> Void)!) {
        
        let moveAnim = POPSpringAnimation(propertyNamed: kPOPLayerPosition)
        moveAnim.toValue = NSValue(CGPoint: position)
        moveAnim.springBounciness = 5
        moveAnim.springSpeed = 5
        moveAnim.completionBlock = completionBlock
        view.pop_addAnimation(moveAnim, forKey: "moveToPosition")
    }
    
}




