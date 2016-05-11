//
//  CustomButton.swift
//  Big O Training
//
//  Created by Mikael Mukhsikaroyan on 5/11/16.
//  Copyright © 2016 MSquaredmm. All rights reserved.
//

import UIKit
import pop

@IBDesignable
class CustomButton: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 5.0 {
        didSet {
            setupView()
        }
    }
    
    @IBInspectable var fontColor: UIColor = UIColor.whiteColor() {
        didSet {
            setupView()
        }
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    func setupView() {
        
        layer.cornerRadius = cornerRadius
        self.tintColor = fontColor
        titleLabel?.adjustsFontSizeToFitWidth = true
        
        addTarget(self, action: #selector(CustomButton.scaleToSmall), forControlEvents: .TouchDown)
        addTarget(self, action: #selector(CustomButton.scaleToSmall), forControlEvents: .TouchDragEnter)
        
        addTarget(self, action: #selector(CustomButton.scaleToDefault), forControlEvents: .TouchDragExit)
        
        addTarget(self, action: #selector(CustomButton.scaleAnimation), forControlEvents: .TouchUpInside)
        
    }
    
    func scaleToSmall() {
        let scaleAnim = POPBasicAnimation(propertyNamed: kPOPLayerScaleXY)
        scaleAnim.toValue = NSValue(CGSize: CGSizeMake(0.95, 0.95))
        layer.pop_addAnimation(scaleAnim, forKey: "layerScaleSmallAnimation")
    }
    
    func scaleToDefault() {
        let scaleAnim = POPBasicAnimation(propertyNamed: kPOPLayerScaleXY)
        scaleAnim.toValue = NSValue(CGSize: CGSizeMake(1.0, 1.0))
        layer.pop_addAnimation(scaleAnim, forKey: "layerScaleDefaultAnimation")
    }
    
    func scaleAnimation() {
        let scaleAnim = POPSpringAnimation(propertyNamed: kPOPLayerScaleXY)
        scaleAnim.velocity = NSValue(CGSize: CGSizeMake(3.0, 3.0))
        scaleAnim.toValue = NSValue(CGSize: CGSizeMake(1.0, 1.0))
        scaleAnim.springBounciness = 15
        layer.pop_addAnimation(scaleAnim, forKey: "layerScaleSpringAnimation")
    }

}















