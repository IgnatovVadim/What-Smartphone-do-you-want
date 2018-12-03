//
//  SmartphonesViewController.swift
//  What SmartPhone do you want?
//
//  Created by Вадим Игнатов on 11/28/18.
//  Copyright © 2018 Вадим Игнатов. All rights reserved.
//

import UIKit

class SmartphonesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var mas = [1,2,3]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView(frame: CGRect.zero)
    }

    
    @IBAction func addNewSmartphone(_ sender: UIButton) {
        
        mas.append(2)
        
        tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SmartphonesTableViewCell
        
        cell.nameOfSmartphone.text = "asdfasdfasdfasdfasdfasdfdsadfasdfasdfasdfasdfasdf"
        
        return cell
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      
    }
}
