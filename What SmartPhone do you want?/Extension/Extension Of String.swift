//
//  Extension Of NSString.swift
//  What SmartPhone do you want?
//
//  Created by Вадим Игнатов on 12/11/18.
//  Copyright © 2018 Вадим Игнатов. All rights reserved.
//

import Foundation
import UIKit

extension String
{
    var isDigits: Bool
    {
        if isEmpty
        {
            return false
        }
        
        let nonDigits = CharacterSet.decimalDigits.inverted
        
        return rangeOfCharacter(from: nonDigits) == nil
    }
}
