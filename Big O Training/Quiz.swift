//
//  Quiz.swift
//  Big O Training
//
//  Created by Mikael Mukhsikaroyan on 5/11/16.
//  Copyright © 2016 MSquaredmm. All rights reserved.
//

//
//  Quiz.swift
//  Big O Training
//
//  Created by Mikael Mukhsikaroyan on 5/4/16.
//  Copyright © 2016 MSquaredmm. All rights reserved.
//

import UIKit

class Quiz {
    
    var quizQuestions = [String: [String]]()
    
    enum answerType: String {
        case constant = "O(1)"
        case logarithmic = "O(log n)"
        case linear = "O(n)"
        case loglinear = "O(n log n)"
        case quadradic = "O(n^2)"
        case polynomial = "O(n^c)"
        case exponential = "O(c^n)"
        
        
    }
    
    init() {
        
        // Load the constant questions
        for i in 1...2 {
            do {
                //print("Text: \(qType)\(i)")
                if let path = NSBundle.mainBundle().pathForResource("\(Constants.constant)\(i)", ofType: "txt") {
                    let question = try String(contentsOfFile: path, encoding: NSUTF8StringEncoding)
                    
                    if let _ = quizQuestions[Constants.constant] {
                        //print("Will append")
                        //print(questions)
                        quizQuestions[Constants.constant]!.append(question)
                        //print(quizQuestions[qType])
                    } else {
                        //print("Wrill create")
                        quizQuestions[Constants.constant] = [question]
                        //print(quizQuestions[qType])
                    }
                } else {
                    print("Error getting path to file")
                }
            } catch {
                print("Error loading files")
            }
            
        }
        // Load the exponential
        for i in 1...3 {
            do {
                //print("Text: \(qType)\(i)")
                if let path = NSBundle.mainBundle().pathForResource("\(Constants.exponential)\(i)", ofType: "txt") {
                    let question = try String(contentsOfFile: path, encoding: NSUTF8StringEncoding)
                    
                    if let _ = quizQuestions[Constants.exponential] {
                        //print("Will append")
                        //print(questions)
                        quizQuestions[Constants.exponential]!.append(question)
                        //print(quizQuestions[qType])
                    } else {
                        //print("Wrill create")
                        quizQuestions[Constants.exponential] = [question]
                        //print(quizQuestions[qType])
                    }
                } else {
                    print("Error getting path to file")
                }
            } catch {
                print("Error loading files")
            }
        }
        // Load the linear
        for i in 1...2 {
            do {
                //print("Text: \(qType)\(i)")
                if let path = NSBundle.mainBundle().pathForResource("\(Constants.linear)\(i)", ofType: "txt") {
                    let question = try String(contentsOfFile: path, encoding: NSUTF8StringEncoding)
                    
                    if let _ = quizQuestions[Constants.linear] {
                        //print("Will append")
                        //print(questions)
                        quizQuestions[Constants.linear]!.append(question)
                        //print(quizQuestions[qType])
                    } else {
                        //print("Wrill create")
                        quizQuestions[Constants.linear] = [question]
                        //print(quizQuestions[qType])
                    }
                } else {
                    print("Error getting path to file linear")
                }
            } catch {
                print("Error loading files")
            }
            
        }
        // Load the linearithmic
        for i in 1..<2 {
            do {
                //print("Text: \(qType)\(i)")
                if let path = NSBundle.mainBundle().pathForResource("\(Constants.loglinear)\(i)", ofType: "txt") {
                    let question = try String(contentsOfFile: path, encoding: NSUTF8StringEncoding)
                    
                    if let _ = quizQuestions[Constants.loglinear] {
                        //print("Will append")
                        //print(questions)
                        quizQuestions[Constants.loglinear]!.append(question)
                        //print(quizQuestions[qType])
                    } else {
                        //print("Wrill create")
                        quizQuestions[Constants.loglinear] = [question]
                        //print(quizQuestions[qType])
                    }
                } else {
                    print("Error getting path to file linearithmic")
                }
            } catch {
                print("Error loading files")
            }
            
        }
        // Load the logarithmic
        for i in 1...2 {
            do {
                //print("Text: \(qType)\(i)")
                if let path = NSBundle.mainBundle().pathForResource("\(Constants.logarithmic)\(i)", ofType: "txt") {
                    let question = try String(contentsOfFile: path, encoding: NSUTF8StringEncoding)
                    
                    if let _ = quizQuestions[Constants.logarithmic] {
                        //print("Will append")
                        //print(questions)
                        quizQuestions[Constants.logarithmic]!.append(question)
                        //print(quizQuestions[qType])
                    } else {
                        //print("Wrill create")
                        quizQuestions[Constants.logarithmic] = [question]
                        //print(quizQuestions[qType])
                    }
                } else {
                    print("Error getting path to file linearithmic")
                }
            } catch {
                print("Error loading files")
            }
            
        }
        
        
        print("Quiz questions after init: \(quizQuestions)")
    }
    
    func getRandomQuestion() -> (answer: String, question: String) {
        let answerIndex = Int(arc4random_uniform(UInt32(quizQuestions.count)))
        print("Quiz questions count: \(quizQuestions.count)")
        print("Random Index: \(answerIndex)")
        let answerToIndex = Array(quizQuestions.keys)[answerIndex]
        var answer = "NA"
        switch answerToIndex {
        case "constant":
            answer = answerType.constant.rawValue
        case "exponential":
            answer = answerType.exponential.rawValue
        case "linear":
            answer = answerType.linear.rawValue
        case "linearithmic":
            answer = answerType.loglinear.rawValue
        case "logarithmic":
            answer = answerType.logarithmic.rawValue
            
        default:
            print("Hit defualt")
        }
        
        let questionIndex = Int(arc4random_uniform(UInt32((quizQuestions[answerToIndex]!.count))))
        let question = quizQuestions[answerToIndex]![questionIndex]
        
        print("Random Q/A: \(question), \(answer)")
        return (answer, question)
    }
    
    func getListOfAnswers() -> [String] {
        let aT = answerType.self
        let answers = [aT.constant.rawValue, aT.exponential.rawValue, aT.linear.rawValue, aT.logarithmic.rawValue, aT.loglinear.rawValue]
        return answers
    }
    
}






