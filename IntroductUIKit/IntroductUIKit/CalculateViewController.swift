//
//  CalculateViewController.swift
//  IntroductUIKit
//
//  Created by Toan Tran on 26/10/2022.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    
    var isFinishedTypingNumber: Bool = true
    var isTypingcomma: Bool = true
    
    var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Error")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    var calculate = Calculate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func removeHandle(_ sender: UIButton) {
        displayLabel.text = "0"
    }
    
    
    
    @IBAction func calHandle(_ sender: UIButton) {
        isFinishedTypingNumber = true
        isTypingcomma = true
        if let calMethod = sender.titleLabel?.text {
            calculate.SetNumber(displayValue)
            if let value = calculate.calculator(calMethod: calMethod) {
                displayValue = value
            }
            
        }
    }
    
    @IBAction func numButtonHandle(_ sender: UIButton) {
        if let num = sender.titleLabel?.text {
            
            if isFinishedTypingNumber {
                if num == "." {
                    displayLabel.text = displayLabel.text! + num
                } else {
                    displayLabel.text = num
                }
                isFinishedTypingNumber = false
            } else {
                if num == "." {
                    if isTypingcomma {
                        isTypingcomma = false
                    }
                    let isInt = floor(displayValue) == displayValue
                    if !isInt {
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + num
                
            }
        }
    }
    

}
