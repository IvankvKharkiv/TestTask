//
//  Cuatom_TableViewCell.swift
//  TestTask_Fin
//
//  Created by iv on 5/10/20.
//  Copyright © 2020 iv. All rights reserved.
//

import UIKit

class Custom_TableViewCell: UITableViewCell {
    
    @IBOutlet weak var lbl_web_url: UILabel!
    
    @IBOutlet weak var lbl_snippet: UILabel!
    
    @IBOutlet weak var lbl_headline_main: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
