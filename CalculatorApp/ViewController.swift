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
    
    var dotIsPlaced = false
    
    var firstOperand: Double = 0
    
    var secondOperator: Double = 0
    
    var operationSign: String = ""
    
    var currentInput: Double {
        get {
            return Double(displayResultLabel.text!)!
        }
        set {
            let value = "\(newValue)"
            let valueArray = value.components(separatedBy: ".")
            if valueArray[1] == "0" {
                displayResultLabel.text = "\(valueArray[0])"
            } else {
                displayResultLabel.text = "\(newValue)"
            }
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
        dotIsPlaced = false
        
    }
    
    func operateWithTwoOperands(operation:(Double, Double) -> Double) {
        currentInput = operation(firstOperand, secondOperator)
        stillTyping = false
    }
    
    
    @IBAction func equalitySingButton(_ sender: UIButton) {
        if stillTyping {
            secondOperator = currentInput
        }
        
        dotIsPlaced = false
        
        switch operationSign {
        case "+":
            operateWithTwoOperands {$0 + $1}
        case "-":
            operateWithTwoOperands {$0 - $1}
        case "*":
            operateWithTwoOperands {$0 * $1}
        case "/":
            operateWithTwoOperands {$0 / $1}
        default:
            break
        }
    }
    
    
    
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        
        firstOperand = 0
        secondOperator = 0
        currentInput = 0
        displayResultLabel.text = "0"
        stillTyping = false
        operationSign = ""
        dotIsPlaced = false
    
    }
    
    
    @IBAction func plusMinusButtonPressed(_ sender: UIButton) {
        
        currentInput = -currentInput
    }
    
    
    @IBAction func percentageButtonPressed(_ sender: UIButton) {
        
        if firstOperand == 0 {
            currentInput = currentInput / 100
        } else {
            secondOperator = firstOperand * currentInput / 100
        }
        stillTyping = false
    }
    
    
    @IBAction func squareRootButtonPressed(_ sender: UIButton) {
        
        currentInput = sqrt(currentInput)
        
    }
    
    
    @IBAction func dotButtonPressed(_ sender: UIButton) {
        
        if stillTyping && !dotIsPlaced {
            displayResultLabel.text = displayResultLabel.text! + "."
            dotIsPlaced = true
        } else if !stillTyping && !dotIsPlaced {
            displayResultLabel.text = "0."
        }
        
    }
    
}
