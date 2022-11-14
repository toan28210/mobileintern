//
//  CalculateLogic.swift
//  IntroductUIKit
//
//  Created by Toan Tran on 26/10/2022.
//

import Foundation


struct Calculate {
    private var number: Double?
    
    private var interNumber: (n1: Double, sybol: String)?
    
    mutating func SetNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func performCalculate(n2: Double) -> Double {
        if let number1 = interNumber?.n1, let calculation = interNumber?.sybol {
            switch calculation {
                case "+":
                    return number1 + n2
                case "-":
                    return number1 - n2
                case "X":
                    return number1 * n2
                case "/":
                    return number1 / n2
            default:
                return n2
            }
        }
        return n2
    }
    
    mutating func calculator(calMethod: String) -> Double? {
        if let numValue = number { //  9/9
            switch calMethod {
            case "AC":
                return 0
            case "C":
                return 0
            case "+/-":
                return numValue * -1
            case "%":
                return numValue * 0.01
            case "=":
                return performCalculate(n2: numValue)
            default:
                interNumber = (numValue, calMethod)
            }
        }
        return nil
    }
    
    
}
