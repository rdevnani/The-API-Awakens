//
//  CurrencyCell.swift
//  API Awaken
//
//  Created by Rohit Devnani on 9/9/17.
//  Copyright © 2017 Rohit Devnani. All rights reserved.
//


import UIKit

class CurrencyCell: UITableViewCell {
    static let reuseIdentifier = "currencyCell"
    
    weak var vehicle: Vehicle?
    
    @IBOutlet weak var labelKey: UILabel!
    @IBOutlet weak var labelValue: UILabel!
    @IBOutlet weak var usdButton: UIButton!
    @IBOutlet weak var galacticCreditsButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        // We'll always start with galactic credits
        galacticCreditsButton.titleLabel?.textColor = .white
    }
    
    func convertToGalacticCredits() {
        if !galacticCreditsButton.isSelected {
            galacticCreditsButton.isSelected = true
            usdButton.isSelected = false
            
            labelValue.text = vehicle?.cost
        }
    }
    
    func convertToUSD() {
        if !usdButton.isSelected {
            guard let vehicle = vehicle else { fatalError("Entity must be provided") }
            galacticCreditsButton.isSelected = false
            usdButton.isSelected = true
            let costString = vehicle.cost
            let cost = Float(costString)!
            
            labelValue.text = "\(Settings.conversionRate * cost)"
        }
    }
}
