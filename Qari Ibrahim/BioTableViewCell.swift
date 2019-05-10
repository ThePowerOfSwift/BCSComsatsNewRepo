//
//  BioTableViewCell.swift
//  Qari Ibrahim
//
//  Created by tahir hameed on 10/05/2019.
//  Copyright © 2019 Muhammad Amir. All rights reserved.
//

import UIKit

class BioTableViewCell: UITableViewCell {

    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
