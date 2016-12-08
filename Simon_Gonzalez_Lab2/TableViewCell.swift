//
//  TableViewCell.swift
//  
//
//  Created by macadmin on 2016-03-28.
//
//

import UIKit

class TableViewCell: UITableViewCell {
    
    //Vars
    
    
    //Controls
    @IBOutlet weak var lblCity: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
