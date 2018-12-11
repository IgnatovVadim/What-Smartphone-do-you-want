//
//  CreateOrEditSmartphoneTableViewController.swift
//  What SmartPhone do you want?
//
//  Created by Вадим Игнатов on 12/2/18.
//  Copyright © 2018 Вадим Игнатов. All rights reserved.
//

import UIKit

protocol CreateOrEditSmartphoneTableViewControllerDelegate
{
    func get(smartphone: Smartphone)
    func editSmartphone()
}

class CreateOrEditSmartphoneTableViewController: UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    var delegate: CreateOrEditSmartphoneTableViewControllerDelegate?
    
    var operatingSystems = ["iOS", "Android OS", "Blackberry OS", "Windows OS", "Bada OS", "Palm OS", "Open WebOS", "Maemo OS"]
    
    var smartphone: Smartphone?
    
    @IBOutlet weak var back: UIBarButtonItem!
    @IBOutlet weak var save: UIBarButtonItem!
    @IBOutlet weak var smartphoneName: UITextField!
    @IBOutlet weak var smartphoneCost: UITextField!
    @IBOutlet weak var smartphoneScreenSize: UITextField!
    @IBOutlet weak var smartphoneOperatingSystem: UIPickerView!
    @IBOutlet weak var smartphoneMPOfCamera: UITextField!
    @IBOutlet weak var smartphoneVideoconference: UISwitch!
    
    var phoneName: String
    {
        get
        {
            return smartphoneName.text!
        }
    }
    
    var phoneCost: String
    {
        get
        {
            return smartphoneCost.text!
        }
    }
    
    var phoneScreenSize: String
    {
        get
        {
            return smartphoneScreenSize.text!
        }
    }
    
    var phoneMPOfCamera: String
    {
        get
        {
            return smartphoneMPOfCamera.text!
        }
    }
    
    @IBAction func textInTextFieldChanged(_ sender: UITextField) {
        isSaveEnabled()
    }
    
    @IBAction func backToPreviousScreen(_ sender: UIBarButtonItem) {
        dismiss(animated: true) {
            
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField)
    {
        let text = textField.text!
        if (text.contains(","))
        {
            textField.text! = text.replacingOccurrences(of: ",", with: ".", options: .regularExpression, range: nil)
        }
    }
    
    @IBAction func saveNewOrEditedInformation(_ sender: UIBarButtonItem) {
        let selectedOperatingSystem = smartphoneOperatingSystem.selectedRow(inComponent: 0)
        if (smartphone == nil)
        {
            smartphone = Smartphone(name: phoneName, cost: Double(phoneCost)!, screenSize: Double(phoneScreenSize)!, operatingSystem: operatingSystems[selectedOperatingSystem], cameraMP: Double(phoneMPOfCamera)!, videoconference: smartphoneVideoconference.isOn)
            delegate?.get(smartphone: smartphone!)
        }
        else
        {
            smartphone?.name = phoneName
            smartphone?.cost = Double(phoneCost)!
            smartphone?.screenSize = Double(phoneScreenSize)!
            smartphone?.operatingSystem = operatingSystems[selectedOperatingSystem]
            smartphone?.cameraMP = Double(phoneMPOfCamera)!
            smartphone?.videoconference = smartphoneVideoconference.isOn
            delegate?.editSmartphone()
        }
        
        Smartphone.saveData()
        
        backToPreviousScreen(back)
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func isSaveEnabled()
    {
        save.isEnabled = !phoneName.isEmpty && !phoneCost.isEmpty && !phoneScreenSize.isEmpty && !phoneMPOfCamera.isEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        smartphoneCost.delegate = self
        smartphoneScreenSize.delegate = self
        smartphoneMPOfCamera.delegate = self
        smartphoneVideoconference.isOn = false
        if (smartphone != nil)
        {
            editingSmartphone()
        }
        isSaveEnabled()
    }

    func editingSmartphone()
    {
        smartphoneName.text = smartphone!.name
        smartphoneCost.text = String(smartphone!.cost)
        smartphoneScreenSize.text = String(smartphone!.screenSize)
        smartphoneMPOfCamera.text = String(smartphone!.cameraMP)
        smartphoneVideoconference.isOn = smartphone!.videoconference
        let row = operatingSystems.firstIndex(of: smartphone!.operatingSystem!)!
        smartphoneOperatingSystem.selectRow(row, inComponent: 0, animated: true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return operatingSystems.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return operatingSystems[row]
    }
}
