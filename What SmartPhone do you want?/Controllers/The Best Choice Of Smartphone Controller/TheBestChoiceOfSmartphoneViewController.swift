//
//  TheBestChoiceOfSmartphoneViewController.swift
//  What SmartPhone do you want?
//
//  Created by Вадим Игнатов on 12/5/18.
//  Copyright © 2018 Вадим Игнатов. All rights reserved.
//

import UIKit

class TheBestChoiceOfSmartphoneViewController: UIViewController {


    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func backToPreviousScreen(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
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
