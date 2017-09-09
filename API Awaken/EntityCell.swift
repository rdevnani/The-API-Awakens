//
//  EntityCell.swift
//  API Awaken
//
//  Created by Rohit Devnani on 9/9/17.
//  Copyright © 2017 Rohit Devnani. All rights reserved.
//

import UIKit

class EntityCell: UITableViewCell {
    
    static let reuseIdentifier = "entityCell"
    
    @IBOutlet weak var labelKey: UILabel!
    @IBOutlet weak var labelKeyWidth: NSLayoutConstraint!
    @IBOutlet weak var labelValue: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
