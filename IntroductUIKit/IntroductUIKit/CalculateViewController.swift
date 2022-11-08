//
//  CalculateViewController.swift
//  IntroductUIKit
//
//  Created by Toan Tran on 26/10/2022.
//

import UIKit
protocol SomeProtocol: Equatable {}

class CalculateViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    
    @IBOutlet weak var plusBtn: UIButton!
    @IBOutlet weak var minusBtn: UIButton!
    @IBOutlet weak var multiBtn: UIButton!
    @IBOutlet weak var diviBtn: UIButton!
    @IBOutlet weak var acBtn: UIButton!
    @IBOutlet weak var equaBtn: UIButton!
    
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
            updateLabel()
        }
    }
    var calculate = Calculate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addUIButton()
    }
    
    @IBAction func calHandle(_ sender: UIButton) {
        isFinishedTypingNumber = true
        isTypingcomma = true
        addUIButton()
        if sender.tag <= 3 {
            animationButton(sender)
        }
        if let calMethod = sender.titleLabel?.text {
            calculate.SetNumber(displayValue)
            if let value = calculate.calculator(calMethod: calMethod) {
                if floor(value) == value {
                    let intNumber = Int(value)
                    displayLabel.text = String(intNumber)
                } else {
                    displayValue = value
                }
            }
            
        }
        updateLabel()
        updateUIAC()
    }
    
    @IBAction func numButtonHandle(_ sender: UIButton) {
        guard let text = displayLabel.text else {
            return
        }
        if let num = sender.titleLabel?.text {
            if isFinishedTypingNumber {
                if num == "." {
                    displayLabel.text = text + num
                } else {
                    displayLabel.text = num
                }
                isFinishedTypingNumber = false
            } else {
                if num == "." {
                    if isTypingcomma {
                        isTypingcomma = false
                    }
                    if text.contains(".") {
                        return
                    }
                }
                if let intNum = Int(text + num) {
                    displayLabel.text = String(intNum)
                } else {
                    displayLabel.text = text + num
                }
                
            }
        }
        updateLabel()
        updateUIAC()
        addUIButton()
    }
    func updateUIAC() {
        if displayValue != 0 {
            acBtn.titleLabel?.text = "C"
        } else {
            acBtn.titleLabel?.text = "AC"
        }
    }
    
    func updateLabel() {
        if let number = displayLabel.text {
            if number.count >= 7 {
                displayLabel.font = UIFont.systemFont(ofSize: 40)
            } else {
                displayLabel.font = UIFont.systemFont(ofSize: 80)
            }
        }
    }
    
    func addUIButton() {
        customButton(diviBtn)
        customButton(multiBtn)
        customButton(minusBtn)
        customButton(plusBtn)
        customButton(equaBtn)
    }
    
    func customButton(_ button: UIButton){
        button.backgroundColor = UIColor(cgColor: CGColor(red: 242/255, green: 147/255, blue: 59/255, alpha: 1))
        button.layer.cornerRadius = button.frame.width/2
        button.tintColor = .white
    }
    
    func animationButton(_ viewToAnimation: UIButton) {
        viewToAnimation.backgroundColor = .white
        viewToAnimation.tintColor = UIColor(cgColor: CGColor(red: 242/255, green: 147/255, blue: 59/255, alpha: 1))
    }
    
}
