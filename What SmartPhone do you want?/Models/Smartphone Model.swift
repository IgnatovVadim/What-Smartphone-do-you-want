//
//  Smartphone Model.swift
//  What SmartPhone do you want?
//
//  Created by Вадим Игнатов on 12/3/18.
//  Copyright © 2018 Вадим Игнатов. All rights reserved.
//

import Foundation
import UIKit
import CoreData

@objc(Smartphone)
class Smartphone : NSManagedObject
{
    @NSManaged var name: String?
    @NSManaged var cost: Double
    @NSManaged var screenSize: Double
    @NSManaged var operatingSystem: String?
    @NSManaged var cameraMP: Double
    @NSManaged var videoconference: Bool
    
    static let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    static let entity = NSEntityDescription.entity(forEntityName: "Smartphone", in: Smartphone.context)!
    
    
    init(name: String?, cost: Double, screenSize: Double, operatingSystem: String?, cameraMP: Double, videoconference: Bool)
    {
        super.init(entity: Smartphone.entity, insertInto: Smartphone.context)
        self.name = name
        self.cost = cost
        self.screenSize = screenSize
        self.operatingSystem = operatingSystem
        self.cameraMP = cameraMP
        self.videoconference = videoconference
    }
    
    func saveData()
    {
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }
    
    func fetchData() -> [Smartphone]
    {
        let request = NSFetchRequest<Smartphone>(entityName: "Smartphone")
        
        do
        {
            return try Smartphone.context.fetch(request)
        }
        catch
        {
            return []
        }
        
    }
    
    
}
