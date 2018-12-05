//
//  OptimizationViewController.swift
//  What SmartPhone do you want?
//
//  Created by Вадим Игнатов on 12/5/18.
//  Copyright © 2018 Вадим Игнатов. All rights reserved.
//

import UIKit

class OptimizationViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var searchForSingleCriticalOptimization: UIButton!
    @IBOutlet weak var parametersNamesForSingleCriticalOptimization: UIPickerView!
    
    var massiveOfParametersNamesForSingleCriticalOptimization = ["Maximum Cost", "Minimum Cost"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tuningOfShadowFor(button: searchForSingleCriticalOptimization, width: 10, height: 5)
        tuningOf(button: searchForSingleCriticalOptimization)
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
    
    @IBAction func singleCriticalSearch(_ sender: UIButton) {
        tuningOfShadowFor(button: searchForSingleCriticalOptimization, width: 10, height: 5)
    }
    
    @IBAction func touchDownTheButtonOfSingleCriticalOptimization(_ sender: UIButton) {
        tuningOfShadowFor(button: searchForSingleCriticalOptimization, width: 0, height: 0)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return massiveOfParametersNamesForSingleCriticalOptimization[row]
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
