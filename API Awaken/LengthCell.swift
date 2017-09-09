//
//  LengthCell.swift
//  API Awaken
//
//  Created by Rohit Devnani on 9/9/17.
//  Copyright © 2017 Rohit Devnani. All rights reserved.
//

import UIKit

class LengthCell: UITableViewCell {
    
    static let reuseIdentifier = "lengthCell"
    
    weak var entity: Entity?
    
    @IBOutlet weak var labelKey: UILabel!
    @IBOutlet weak var labelValue: UILabel!
    @IBOutlet weak var englishButton: UIButton!
    @IBOutlet weak var metricButton: UIButton!
    
    func convertToEnglish() {
        guard let entity = entity else { fatalError("entity must be provided") }
        if !englishButton.isSelected {
            englishButton.isSelected = true
            metricButton.isSelected = false
            
            if let meters = Float(entity.length) {
                let centimeters = meters * 100.0
                let inches = centimeters * 0.39
                let feet = Int(inches) / 12
                let remainingInches = feet % 12
                
                labelValue.text = "\(feet)ft. \(remainingInches)in."
            } else {
                labelValue.text = "Unknown"
            }
            
        }
    }
    
    func convertToMetric() {
        guard let entity = entity else { fatalError("entity must be provided") }
        if !metricButton.isSelected {
            englishButton.isSelected = false
            metricButton.isSelected = true
            
            labelValue.text = "\(entity.length)m"
        }
    }
}
