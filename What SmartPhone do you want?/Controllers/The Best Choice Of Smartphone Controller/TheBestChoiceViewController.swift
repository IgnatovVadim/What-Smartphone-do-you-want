//
//  TheBestChoiceViewController.swift
//  What SmartPhone do you want?
//
//  Created by Вадим Игнатов on 12/10/18.
//  Copyright © 2018 Вадим Игнатов. All rights reserved.
//

import UIKit

class TheBestChoiceViewController: UIViewController {

    @IBOutlet weak var nameOfSmartphone: UILabel!
    @IBOutlet weak var costOfSmartphone: UILabel!
    @IBOutlet weak var screenSizeOfSmartphone: UILabel!
    @IBOutlet weak var operatingSystemOfSmartphone: UILabel!
    @IBOutlet weak var mpOfCameraOfSmartphone: UILabel!
    @IBOutlet weak var videoconferenceOfSmarphone: UILabel!
    @IBOutlet weak var nextPhone: UILabel!
    @IBOutlet weak var previousPhone: UILabel!
    
    
    
    var theBestSmartphones: [Smartphone] = []
    var indexOfCurrentSmartphone = 0;
    
    @IBAction func backToPreviousScreen(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nextSwipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(nextPhoneWith(gesture:)))
        nextSwipeRecognizer.direction = .left
        self.view.addGestureRecognizer(nextSwipeRecognizer)
        
        let previousSwipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(previousPhoneWith(gesture:)))
        previousSwipeRecognizer.direction = .right
        self.view.addGestureRecognizer(previousSwipeRecognizer)
        
        isHiddenNextOrPreviousSmartphone()
        
        showPhone()
        
    }
    
    func isHiddenNextOrPreviousSmartphone()
    {
        if (indexOfCurrentSmartphone + 1 >= theBestSmartphones.count)
        {
            nextPhone.isHidden = true
        }
        else
        {
            nextPhone.isHidden = false
        }
        
        if (indexOfCurrentSmartphone - 1 < 0)
        {
            previousPhone.isHidden = true
        }
        else
        {
            previousPhone.isHidden = false
        }
        
    }
    
    @objc
    func nextPhoneWith(gesture: UISwipeGestureRecognizer)
    {
        if (indexOfCurrentSmartphone < theBestSmartphones.count - 1)
        {
            indexOfCurrentSmartphone += 1;
            showPhone();
        }
        
        isHiddenNextOrPreviousSmartphone()
        
    }
    
    @objc
    func previousPhoneWith(gesture: UISwipeGestureRecognizer)
    {
        if (indexOfCurrentSmartphone != 0)
        {
            indexOfCurrentSmartphone -= 1;
            showPhone();
        }
        
        isHiddenNextOrPreviousSmartphone()
        
    }
    
    func showPhone()
    {
        nameOfSmartphone.text = theBestSmartphones[indexOfCurrentSmartphone].name
        costOfSmartphone.text = "Cost: \(String(theBestSmartphones[indexOfCurrentSmartphone].cost)) dollars"
        screenSizeOfSmartphone.text = "Screen size: \(String(theBestSmartphones[indexOfCurrentSmartphone].screenSize)) inches"
        operatingSystemOfSmartphone.text = "Operating system: \(theBestSmartphones[indexOfCurrentSmartphone].operatingSystem!)"
        mpOfCameraOfSmartphone.text = "Camera: \(String(theBestSmartphones[indexOfCurrentSmartphone].cameraMP)) MP"
        videoconferenceOfSmarphone.text = "Videoconference: "
        if (theBestSmartphones[indexOfCurrentSmartphone].videoconference)
        {
            videoconferenceOfSmarphone.text! += "Yes"
        }
        else
        {
            videoconferenceOfSmarphone.text! += "No"
        }
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
