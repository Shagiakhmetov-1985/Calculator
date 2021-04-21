//
//  ViewController.swift
//  Calculator
//
//  Created by Marat Shagiakhmetov on 08.04.2021.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var enterLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet var keyboardButtons: [UIButton]!
    
    @IBOutlet weak var enterView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonsForm()
        display()
        
    }
    // MARK: Enter buttons
    @IBAction func enterButtons(_ sender: UIButton) {
        guard let buttonIndex = keyboardButtons.firstIndex(of: sender) else { return }
        enterDisplay(value: keyboardButtons[buttonIndex].currentTitle!)
    }
    // MARK: Setup buttons
    private func buttonsForm() {
        for button in keyboardButtons {
            button.layer.cornerRadius = button.frame.height / 4
            button.layer.borderWidth = 1.5
            button.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        }
        
        for button in keyboardButtons {
            switch button.currentTitle {
            case "+", "−", "×", "÷", "=":
                button.layer.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
            case "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ".":
                button.layer.backgroundColor = #colorLiteral(red: 0.6225932776, green: 0.4482305237, blue: 0.9686274529, alpha: 1)
            default:
                button.layer.backgroundColor = #colorLiteral(red: 0.5532225755, green: 0.6047652586, blue: 0.9686274529, alpha: 1)
            }
        }
    }
    // MARK: Setup display
    private func display() {
        enterLabel.text = nil
        resultLabel.text = "0"
        
        enterView.layer.borderWidth = 2.5
        enterView.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        enterView.layer.cornerRadius = enterLabel.frame.height / 3
    }
    // MARK: Enter display
    private func enterDisplay(value: String) {
        switch value {
        case "0", "1", "2", "3", "4", "5", "6", "7", "8", "9":
            enterNumbers(numbers: value)
        case "+", "−", "×", "÷":
            enterCalculations(calculations: value)
//        case "±":
//            positiveNegativeValue(positiveNegative: value)
        case ".":
            fraction(fractionValue: value)
        case "=":
            resultOperation(result: value)
        default:
            break
        }
    }
    // MARK: Enter numbers
    private func enterNumbers(numbers: String) {
        switch enterLabel.text?.last {
        case "0":
            enterLabel.text = enterLabel.text
        case nil:
            enterLabel.text = numbers
        default:
            enterLabel.text! += numbers
        }
    }
    // MARK: Enter calculations
    private func enterCalculations(calculations: String) {
        switch enterLabel.text?.last {
        case nil, "+", "−", "×", "÷":
            enterLabel.text = enterLabel.text
        default:
            enterLabel.text! += calculations
        }
    }
    // MARK: Positive and negative value
//    private func positiveNegativeValue(positiveNegative: String) {
//        switch enterLabel.text {
//        case enterLabel.text?.first:
//            <#code#>
//        default:
//            <#code#>
//        }
//    }
    // MARK: Fraction
    private func fraction(fractionValue: String) {
        switch enterLabel.text?.last {
        case nil, "0", "1", "2", "3", "4", "5", "6", "7", "8", "9":
            enterLabel.text! += fractionValue
        case ".":
            enterLabel.text = enterLabel.text
        default:
            break
        }
    }
    // MARK: - Result
    private func resultOperation(result: String) {
        
    }
}

