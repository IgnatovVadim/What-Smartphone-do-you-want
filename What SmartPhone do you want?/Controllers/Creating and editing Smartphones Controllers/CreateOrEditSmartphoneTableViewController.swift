//
//  CreateOrEditSmartphoneTableViewController.swift
//  What SmartPhone do you want?
//
//  Created by Вадим Игнатов on 12/2/18.
//  Copyright © 2018 Вадим Игнатов. All rights reserved.
//

import UIKit

class CreateOrEditSmartphoneTableViewController: UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    var operatingSystems = ["iOS", "Android OS", "Blackberry OS", "Windows OS", "Bada OS", "Palm OS", "Open WebOS", "Maemo OS"]
    
    @IBOutlet weak var save: UIBarButtonItem!
    @IBOutlet weak var smartphoneName: UITextField!
    @IBOutlet weak var smartphoneCost: UITextField!
    @IBOutlet weak var smartphoneScreenSize: UITextField!
    @IBOutlet weak var smartphoneOperatingSystem: UIPickerView!
    @IBOutlet weak var smartphoneMPOfCamera: UITextField!
    @IBOutlet weak var smartphoneVideoconference: UISwitch!
    
    @IBAction func textInTextFieldChanged(_ sender: UITextField) {
        isSaveEnabled()
    }
    
    @IBAction func backToPreviousScreen(_ sender: UIBarButtonItem) {
        dismiss(animated: true) {
            
        }
    }
    
    @IBAction func saveInformation(_ sender: UIBarButtonItem) {
        let selectedOperatingSystem = smartphoneOperatingSystem.selectedRow(inComponent: 0)
        let smartphone = Smartphone(name: smartphoneName.text!, cost: Double(smartphoneCost.text!)!, screenSize: Double(smartphoneScreenSize.text!)!, operatingSystem: operatingSystems[selectedOperatingSystem], cameraMP: Double(smartphoneMPOfCamera.text!)!, videoconference: smartphoneVideoconference.isOn)
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @objc func isSaveEnabled()
    {
        if (!(smartphoneName.text?.isEmpty)! && !(smartphoneCost.text?.isEmpty)! && !(smartphoneScreenSize.text?.isEmpty)! && !(smartphoneMPOfCamera.text?.isEmpty)!)
        {
            save.isEnabled = true
        }
        else
        {
            save.isEnabled = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        isSaveEnabled()
        smartphoneVideoconference.isOn = false
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
