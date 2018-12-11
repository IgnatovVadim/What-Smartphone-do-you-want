//
//  Optimization.swift
//  What SmartPhone do you want?
//
//  Created by Вадим Игнатов on 12/10/18.
//  Copyright © 2018 Вадим Игнатов. All rights reserved.
//

import Foundation
import UIKit

class Optimization
{
    var smartphones = Smartphone.fetchData().sorted(by: {$0.cost < $1.cost})
    var bestSmartphones: [Smartphone] = []
    
    func singleCriticalOptimizationWithAmountOf(money: Double) -> [Smartphone]
    {
        var smartphoneWithNearestPrice: Smartphone?
        for index in (0..<smartphones.count).reversed()
        {
            if (smartphones[index].cost <= money)
            {
                if (smartphoneWithNearestPrice == nil || smartphones[index].cost == smartphoneWithNearestPrice?.cost)
                {
                    smartphoneWithNearestPrice = smartphones[index]
                    bestSmartphones.append(smartphoneWithNearestPrice!)
                }
                else
                {
                    break
                }
            }
        }
        
        return bestSmartphones
    }
    
}
