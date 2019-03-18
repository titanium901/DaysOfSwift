//
//  ViewController.swift
//  Calculator
//
//  Created by Yury Popov on 15/03/2019.
//  Copyright © 2019 Yury Popov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var analogButton: [UIButton]!
    @IBOutlet weak var mathView: UIView!
    @IBOutlet weak var modeLabel: UILabel!
    @IBOutlet weak var switchDarkOrLight: UISwitch!
    @IBOutlet weak var displayResultLabel: UILabel!
    var stillTyping = false
    var dotIsPlaced = false
    var firstOperand: Double = 0
    var secondOperand: Double = 0
    var operationSign = ""
    var currentInput: Double {
        get {
            return Double(displayResultLabel.text!)!
        }
        set {
            let value = "\(newValue)"
            var valueArray = value.components(separatedBy: ".")
            if valueArray[1] == "0" {
                displayResultLabel.text = valueArray[0]
            } else {
                displayResultLabel.text = "\(newValue)"
            }
            stillTyping = false
        }
    }
    var style:UIStatusBarStyle = .lightContent
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return self.style
    }
    
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switchDarkOrLight.isOn = false
        switchDarkOrLight.onTintColor = .white
        switchDarkOrLight.tintColor = .white
        self.setNeedsStatusBarAppearanceUpdate()
    
    }
    
    
    

    
    @IBAction func numberPressed(_ sender: UIButton) {
        let number = sender.currentTitle
        if stillTyping {
            if displayResultLabel.text!.count < 20 {
                displayResultLabel.text = displayResultLabel.text! + number!
            }
        
        } else {
            displayResultLabel.text = number
            stillTyping = true
        }
    }
    @IBAction func twoOperandsSignPressed(_ sender: UIButton) {
        operationSign = sender.currentTitle!
        firstOperand = currentInput
        stillTyping = false
    }
    func operateWithTwoOperands(operation: (Double, Double) -> Double) {
        currentInput = operation(firstOperand, secondOperand)
        stillTyping = false
        dotIsPlaced = false
    }
    
    @IBAction func equalitySignPressed(_ sender: UIButton) {
        if stillTyping {
            secondOperand = currentInput
        }
        
        dotIsPlaced = false
        
        switch operationSign {
        case "+":
            operateWithTwoOperands{$0 + $1}
        case "-":
            operateWithTwoOperands{ $0 - $1 }
        case "×":
            operateWithTwoOperands{ $0 * $1 }
        case "÷":
            operateWithTwoOperands{ $0 / $1 }
        default:
            break
        }
    }
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        firstOperand = 0
        secondOperand = 0
        currentInput = 0
        displayResultLabel.text = "0"
        stillTyping = false
        dotIsPlaced = false
        operationSign = ""
    }
    @IBAction func plusMinusButtonPressed(_ sender: UIButton) {
        currentInput = -currentInput
    }
    @IBAction func percentageButtonPressed(_ sender: UIButton) {
        if firstOperand == 0 {
            currentInput = currentInput / 100
        } else {
            secondOperand = firstOperand * currentInput / 100
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
    
    @IBAction func switchMode(_ sender: UISwitch) {
        if switchDarkOrLight.isOn == true {
            style = .default
            view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            modeLabel.text = "Dark Mode"
            modeLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            displayResultLabel.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            displayResultLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            mathView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            switchDarkOrLight.onTintColor = .black
            switchDarkOrLight.tintColor = .black
            for button in analogButton {
//                button.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                button.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
            }
            
            
            
            
        } else {
            view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)

            style = .lightContent
            modeLabel.text = "Light Mode"
            modeLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            displayResultLabel.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            displayResultLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            mathView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            switchDarkOrLight.onTintColor = .white
            switchDarkOrLight.tintColor = .white
            for button in analogButton {
                //                button.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
            }
            
            
        }
        setNeedsStatusBarAppearanceUpdate()
    }
    
    
    
//    func changeColorButtonToBlack(sender: UIButton) {
//        sender.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
//    }
}

