//
//  orderCell.swift
//  WinDelivery
//
//  Created by Isaac Botwe on 19/01/2019.
//  Copyright © 2019 Isaac Annan. All rights reserved.
//

import UIKit

class orderCell: UITableViewCell {
   
    @IBOutlet weak var orderName: UILabel!
    @IBOutlet weak var serviceID: UILabel!
    @IBOutlet weak var deliveryName: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var totalAmount: UILabel!
    @IBOutlet weak var dateCreated: UILabel!
    
    
    
    
    var date = ""
    var detail = ""
    var size = ""
    var amount = ""
    var mystatus = ""
   
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
