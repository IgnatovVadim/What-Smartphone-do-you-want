//
//  SmartphonesTableViewCell.swift
//  What SmartPhone do you want?
//
//  Created by Вадим Игнатов on 11/28/18.
//  Copyright © 2018 Вадим Игнатов. All rights reserved.
//

import UIKit

class SmartphonesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameOfSmartphone: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
