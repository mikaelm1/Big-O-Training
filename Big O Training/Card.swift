//
//  Card.swift
//  Big O Training
//
//  Created by Mikael Mukhsikaroyan on 5/11/16.
//  Copyright © 2016 MSquaredmm. All rights reserved.
//

import UIKit
import pop

class Card: UIView {
    
    @IBOutlet weak var questionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupView()
        
        questionLabel.font = UIFont(name: "Helvetica Neue", size: 16)
        questionLabel.adjustsFontSizeToFitWidth = true
        questionLabel.clipsToBounds = true
        questionLabel.text = "Sample text"
    }

    func setupView() {
        
        layer.cornerRadius = 3.0
        layer.shadowColor = UIColor(red: 157/255.0, green: 157/255.0, blue: 157/255.0, alpha: 1).CGColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSizeMake(0, 2.0)
        
        self.setNeedsLayout()
        
        
    }

}
