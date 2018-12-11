//
//  OptimizationViewController.swift
//  What SmartPhone do you want?
//
//  Created by Вадим Игнатов on 12/5/18.
//  Copyright © 2018 Вадим Игнатов. All rights reserved.
//

import UIKit

class OptimizationViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var searchForSingleCriticalOptimization: UIButton!
    
    @IBOutlet weak var amountOfMoneyThatHasPerson: UITextField!
    
    var isButtonForSingleCriticalOptimizationWork = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tuningOfShadowFor(button: searchForSingleCriticalOptimization, width: 10, height: 5)
        tuningOf(button: searchForSingleCriticalOptimization)
        amountOfMoneyThatHasPerson.delegate = self
        
        createSaveAndCancelButtonsForKeyboard()
    }
    
    func createSaveAndCancelButtonsForKeyboard()
    {
        let toolbar = UIToolbar.init()
        toolbar.sizeToFit()
        
        let saveButton = UIBarButtonItem.init(barButtonSystemItem: .save, target: self, action: #selector(endEditingForKeyboardButtons))
        let cancelButton = UIBarButtonItem.init(barButtonSystemItem: .cancel, target: self, action: #selector(endEditingForKeyboardButtons))
        
        toolbar.items = [saveButton, cancelButton]
        
        amountOfMoneyThatHasPerson.inputAccessoryView = toolbar
    }
    
    func tuningOf(button: UIButton)
    {
        button.layer.shadowRadius = 10
        button.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.layer.shadowOpacity = 0.5
        button.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
    }
    
    
    func tuningOfShadowFor(button: UIButton, width: CGFloat, height: CGFloat)
    {
        button.layer.shadowOffset = CGSize(width: width, height: height)
    }
    
    @objc
    func endEditingForKeyboardButtons()
    {
        view.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField)
    {
        guard let text = textField.text, !text.isEmpty, text.isDigits else { isButtonForSingleCriticalOptimizationWork = false
            return
        }
        
        if (text.contains(","))
        {
            textField.text! = text.replacingOccurrences(of: ",", with: ".", options: .regularExpression, range: nil)
        }
        
        isButtonForSingleCriticalOptimizationWork = true
        
    }
    
    @IBAction func singleCriticalSearch(_ sender: UIButton)
    {
        view.endEditing(true)
        tuningOfShadowFor(button: searchForSingleCriticalOptimization, width: 10, height: 5)
    }
    
    @IBAction func touchDownTheButtonOfSingleCriticalOptimization(_ sender: UIButton) {
        tuningOfShadowFor(button: searchForSingleCriticalOptimization, width: 0, height: 0)
    }
    
    func alertForSomeInformation(text: String)
    {
        let alert = UIAlertController(title: nil, message: text, preferredStyle: .alert)
        let buttonOk = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(buttonOk)
        present(alert, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let optimization = Optimization()
        if (segue.identifier == "theBestChoiceOfSingleOptimization")
        {
            if let navigationController = segue.destination as? UINavigationController
            {
                let destination = navigationController.topViewController as? TheBestChoiceViewController
                if (isButtonForSingleCriticalOptimizationWork)
                {
                    let amountOfMoney = amountOfMoneyThatHasPerson.text!
                    let theBestSmartphones = optimization.singleCriticalOptimizationWithAmountOf(money: Double(amountOfMoney)!)
                    if (!theBestSmartphones.isEmpty)
                    {
                        destination?.theBestSmartphones = theBestSmartphones
                    }
                    else
                    {
                        alertForSomeInformation(text: "Ничего не найдено!")
                    }
                }
                else
                {
                    alertForSomeInformation(text: "Вы ничего не ввели в поле 'Enter Amount of Money that You Have' или не нажали кнопку Save")
                }
            }
        }
    }
}
