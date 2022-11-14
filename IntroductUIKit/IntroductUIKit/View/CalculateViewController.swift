//
//  CalculateViewController.swift
//  IntroductUIKit
//
//  Created by Toan Tran on 26/10/2022.
//

import UIKit
//protocol SomeProtocol: Equatable {}

class CalculateViewController: UIViewController {
    
    static let numberOfLabel = 7
    static let tagButtonOperator = 3
    static let doubleNumber = "."

    @IBOutlet weak private var displayLabel: UILabel!
    @IBOutlet weak private var plusBtn: UIButton!
    @IBOutlet weak private var minusBtn: UIButton!
    @IBOutlet weak private var multiBtn: UIButton!
    @IBOutlet weak private var diviBtn: UIButton!
    @IBOutlet weak private var acBtn: UIButton!
    @IBOutlet weak private var equaBtn: UIButton!
    
    var isFinishedTypingNumber: Bool = true
    var isTypingcomma: Bool = true
    
    var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text ?? "0") else {
                return 0
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
        
    }
    override func viewDidAppear(_ animated: Bool) {
        addUIButton()
    }
    
    @IBAction func calHandle(_ sender: UIButton) {
        isFinishedTypingNumber = true
        isTypingcomma = true
        addUIButton()
        if sender.tag <= CalculateViewController.tagButtonOperator {
            sender.animatedButton()
        }
        if let calMethod = sender.titleLabel?.text {
            calculate.setNumber(displayValue)
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
                if num == CalculateViewController.doubleNumber {
                    displayLabel.text = text + num
                } else {
                    displayLabel.text = num
                }
                isFinishedTypingNumber = false
            } else {
                if num == CalculateViewController.doubleNumber {
                    if isTypingcomma {
                        isTypingcomma = false
                    }
                    if text.contains(CalculateViewController.doubleNumber) {
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
            acBtn.setTitle("C", for: .normal)
            addFont("C")
            
        } else {
            acBtn.setTitle("AC", for: .normal)
            addFont("AC")
        }
       
    }
    
    func updateLabel() {
        if let number = displayLabel.text {
            if number.count >= CalculateViewController.numberOfLabel {
                displayLabel.font = UIFont.systemFont(ofSize: 40)
            } else {
                displayLabel.font = UIFont.systemFont(ofSize: 80)
            }
        }
    }
    
    func addUIButton() {
        diviBtn.customButtonStyle()
        multiBtn.customButtonStyle()
        minusBtn.customButtonStyle()
        plusBtn.customButtonStyle()
        equaBtn.customButtonStyle()
    }
    
    func addFont(_ str: String) {
        if let attrFont = CustomFontStyle.attrFont {
            let attrTitle = NSAttributedString(string: str, attributes: [NSAttributedString.Key.font: attrFont])
            acBtn.setAttributedTitle(attrTitle, for: UIControl.State.normal)
        }
    }
}
