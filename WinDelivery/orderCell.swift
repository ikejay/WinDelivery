//
//  orderCell.swift
//  WinDelivery
//
//  Created by Isaac Botwe on 19/01/2019.
//  Copyright © 2019 Isaac Annan. All rights reserved.
//

import UIKit

class orderCell: UITableViewCell {
    @IBOutlet weak var orderLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    var date = ""
    var detail = ""
    var size = ""
    var amount = ""
    var status = ""
   
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
