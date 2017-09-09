//
//  ViewController.swift
//  API Awaken
//
//  Created by Rohit Devnani on 9/9/17.
//  Copyright © 2017 Rohit Devnani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let client = SWAPIClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? EntityController else {
            fatalError("Could not assign destination as an EntityController")
        }
        
        if let identifier = segue.identifier {
            switch identifier {
            case "characterSegue":
                destination.entityType = .character
            case "vehicleSegue":
                destination.entityType = .vehicle
            case "starshipSegue":
                destination.entityType = .starship
            default:
                fatalError("Unknown identifier")
            }
        }
    }
    
}

