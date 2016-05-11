//
//  QuizVC.swift
//  Big O Training
//
//  Created by Mikael Mukhsikaroyan on 5/11/16.
//  Copyright © 2016 MSquaredmm. All rights reserved.
//

import UIKit
import pop

class QuizVC: UIViewController {
    
    @IBOutlet weak var buttonStackHeight: NSLayoutConstraint!
    
    let screen = UIScreen.mainScreen().bounds 
    
    var currentCard: Card!

    override func viewDidLoad() {
        super.viewDidLoad()

        buttonStackHeight.constant = screen.height * 0.25 
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        currentCard = createCardFromNib()
        currentCard.frame = fitCardToScreen()
        view.addSubview(currentCard)
        
    }
    
    func fitCardToScreen() -> CGRect {
        return CGRectMake(screen.width * 0.05, screen.height * 0.1, screen.width * 0.9, screen.height * 0.5)
    }
    
    func createCardFromNib() -> Card {
        return NSBundle.mainBundle().loadNibNamed("Card", owner: self, options: nil)[0] as! Card
    }

    

}
