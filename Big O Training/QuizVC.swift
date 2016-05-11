//
//  QuizVC.swift
//  Big O Training
//
//  Created by Mikael Mukhsikaroyan on 5/11/16.
//  Copyright © 2016 MSquaredmm. All rights reserved.
//

import UIKit
import pop
import GameplayKit

class QuizVC: UIViewController {
    
    @IBOutlet weak var buttonStackHeight: NSLayoutConstraint!
    @IBOutlet weak var buttonA: UIButton!
    @IBOutlet weak var buttonB: UIButton!
    @IBOutlet weak var buttonC: UIButton!
    @IBOutlet weak var buttonD: UIButton!
    @IBOutlet weak var rightCountLabel: UILabel!
    @IBOutlet weak var wrongCountLabel: UILabel!
    
    let screen = UIScreen.mainScreen().bounds 
    
    var currentCard: Card!
    var buttons = [UIButton]()
    var quiz: Quiz!
    var possibleAnswers = [String]()
    var correctButton = 10
    var correctAnswers = 0
    var wrongAnswers = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        buttons = [buttonA, buttonB, buttonC, buttonD]
        buttonStackHeight.constant = screen.height * 0.20
        
        rightCountLabel.text = "Correct: \(correctAnswers)"
        wrongCountLabel.text = "Wrong: \(wrongAnswers)"
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        currentCard = createCardFromNib()
        currentCard.frame = fitCardToScreen()
        
        view.addSubview(currentCard)
        
        quiz = Quiz()
        let question = quiz.getRandomQuestion()
        possibleAnswers = quiz.getListOfAnswers()
        putAnswerInRandom(question.answer)
        
        currentCard.questionLabel.text =  question.question 
        
    }
    
    func putAnswerInRandom (answer: String) {
        let random = Int(arc4random_uniform(UInt32(buttons.count)))
        buttons[random].setTitle(answer, forState: .Normal)
        
        // Will keep track of which button holds the correct answer by its tag. The tags range from 1 - 4
        correctButton = random + 1
        
        print("Answers before shuffle: \(possibleAnswers)")
        let indexToRemove = possibleAnswers.indexOf(answer)
        var copy = possibleAnswers
        copy.removeAtIndex(indexToRemove!)
        print("Answers after removing: \(copy)")
        copy = GKRandomSource.sharedRandom().arrayByShufflingObjectsInArray(copy) as! [String]
        print("Answers after shuffle: \(copy)")
        for i in 0...3 {
            if i != random {
                buttons[i].setTitle(copy[i], forState: .Normal)
            }
        }
    }
    
    func fitCardToScreen() -> CGRect {
        return CGRectMake(screen.width * 0.05, screen.height * 0.1, screen.width * 0.9, screen.height * 0.4)
    }
    
    func createCardFromNib() -> Card {
        return NSBundle.mainBundle().loadNibNamed("Card", owner: self, options: nil)[0] as! Card
    }
    
    func enableUI(enabled: Bool) {
        for button in buttons {
            button.enabled = enabled
        }
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW,Int64(delay * Double(NSEC_PER_SEC))),dispatch_get_main_queue(), closure)
    }
    
    @IBAction func buttonPressed(sender: UIButton) {
        enableUI(false)
        if sender.tag == correctButton {
            correctAnswers += 1
            rightCountLabel.text = "Correct: \(correctAnswers)"
            sender.backgroundColor = UIColor.greenColor()
            delay(3, closure: {
                self.enableUI(true)
                sender.backgroundColor = Constants.customGreen
            })
            print("Correct!")
            
            //enableUI(true)
        } else {
            wrongAnswers += 1
            wrongCountLabel.text = "Wrong: \(wrongAnswers)"
            print("Wrong answer!")
            buttons[correctButton - 1].backgroundColor = UIColor.greenColor()
            sender.backgroundColor = UIColor.redColor()
            delay(3, closure: {
                self.enableUI(true)
                self.buttons[self.correctButton - 1].backgroundColor = Constants.customGreen
                sender.backgroundColor = Constants.customGreen
            })
        }
        
        delay(3) {
            let cardToRemove = self.currentCard
            
            AnimationEngine.animateToPosition(cardToRemove, position: AnimationEngine.offScreenLeftPosition) { (animation, finished) in
                
                cardToRemove.removeFromSuperview()
            }
            
            let new = self.createCardFromNib()
            new.center = AnimationEngine.offScreenRightPosition
            new.frame = self.fitCardToScreen()
            self.view.addSubview(new)
            self.currentCard = new
            let question = self.quiz.getRandomQuestion()
            
            self.putAnswerInRandom(question.answer)
            
            //self.currentCard.codeLabel.text = question.question
            self.currentCard.questionLabel.text = question.question
            let pos = CGPoint(x: self.screen.width * 0.5, y: self.screen.height * 0.4)
            AnimationEngine.animateToPosition(self.currentCard, position: pos) { (animation, finished) in
                
                // do something
                
            }
        }

    }

    

}
