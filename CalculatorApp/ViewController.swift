//
//  ViewController.swift
//  CalculatorApp
//
//  Created by Ostap Artym on 09.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayResultLabel: UILabel!
    
    var stillTyping = false
    
    var firstOperand: Double = 0
    
    var secondOperator: Double = 0
    
    var operationSign: String = ""
    
    var currentInput: Double {
        get {
            Double(displayResultLabel.text!)!
        }
        set {
            displayResultLabel.text = "\(newValue)"
            stillTyping = false
        }
    }
    
    
    
    
    
    //Action
    @IBAction func numberPressed(_ sender: UIButton) {
        
        let number = sender.currentTitle!
        
        if stillTyping {
            if displayResultLabel.text!.count < 20 {
                displayResultLabel.text = displayResultLabel.text! + number}
        } else {
            displayResultLabel.text = number
            stillTyping = true
        }
    }

    
    @IBAction func TwoOperandsSignPressed(_ sender: UIButton) {
        operationSign = sender.currentTitle!
        firstOperand = currentInput
        stillTyping = false
        
    }
    
    func operateWithTwoOperands(operation:(Double, Double) -> Double) {
        currentInput = operation(firstOperand, secondOperator)
        stillTyping = false
    }
    
    
    @IBAction func equalitySingButton(_ sender: UIButton) {
        if stillTyping {
            secondOperator = currentInput
        }
        
        switch operationSign {
        case "+":
            operateWithTwoOperands{$0 + $1}
        case "-":
            operateWithTwoOperands{$0 - $1}
        case "x":
            operateWithTwoOperands{$0 * $1}
        case "÷":
            operateWithTwoOperands{$0 / $1}
        default:
            break
        }
    }
    
    
}
