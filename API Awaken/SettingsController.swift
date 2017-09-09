//
//  ViewController.swift
//  API Awaken
//
//  Created by Rohit Devnani on 9/9/17.
//  Copyright © 2017 Rohit Devnani. All rights reserved.
//


import UIKit

struct Settings {
    static var conversionRate: Float = 2.0
}

class SettingsController: UIViewController {
    @IBOutlet weak var conversionRateTextField: UITextField!
    
    @IBAction func saveButton(_ sender: Any) {
        if let textFieldValue = conversionRateTextField.text {
            Settings.conversionRate = Float(textFieldValue)!
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        conversionRateTextField.text = "\(Settings.conversionRate)"
    }
}





