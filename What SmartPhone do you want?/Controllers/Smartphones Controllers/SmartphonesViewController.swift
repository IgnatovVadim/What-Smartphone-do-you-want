//
//  SmartphonesViewController.swift
//  What SmartPhone do you want?
//
//  Created by Вадим Игнатов on 11/28/18.
//  Copyright © 2018 Вадим Игнатов. All rights reserved.
//

import UIKit

class SmartphonesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CreateOrEditSmartphoneTableViewControllerDelegate{
    
    @IBOutlet weak var delete: UIBarButtonItem!
    
    @IBOutlet weak var tableView: UITableView!
    
    var smartphones: [Smartphone] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        fetchData()
    }
    
    @IBAction func deleteMode(_ sender: UIBarButtonItem) {
        
        let deleteButton = sender
        let deleteMode = tableView.isEditing
        if (deleteMode)
        {
            deleteButton.title = "Delete"
        }
        else
        {
            deleteButton.title = "Done"
        }
        
        tableView.setEditing(!deleteMode, animated: true)
        
    }
    
    func get(smartphone: Smartphone)
    {
        smartphones.append(smartphone)
        
        tableView.reloadData()
    }
    
    func editSmartphone()
    {
        tableView.reloadData()
    }
    
    @IBAction func addNewSmartphone(_ sender: UIButton) {
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
    }

    
    func fetchData()
    {
        smartphones = Smartphone.fetchData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return smartphones.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SmartphonesTableViewCell
        
        let smartphone = smartphones[indexPath.row]
        
        cell.nameOfSmartphone.text = smartphone.name
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete
        {
            let smartphone = smartphones.remove(at: indexPath.row)
            
            Smartphone.delete(this: smartphone)
            
            Smartphone.saveData()
            
            tableView.reloadData()
            
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let navigationController = segue.destination as? UINavigationController
        {
            let destination = navigationController.topViewController as! CreateOrEditSmartphoneTableViewController
            destination.delegate = self
            if segue.identifier == "createSmartphoneSegue"
            {
                destination.save.title = "Save"
            }
            else
            {
                if let cell = sender as? SmartphonesTableViewCell
                {
                    let row = tableView.indexPath(for: cell)?.row
                    destination.smartphone = smartphones[row!]
                    destination.save.title = "Edit"
                }
            }
        }
    }
}
