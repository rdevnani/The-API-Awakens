//
//  ViewController.swift
//  API Awaken
//
//  Created by Rohit Devnani on 9/9/17.
//  Copyright © 2017 Rohit Devnani. All rights reserved.
//

import UIKit

enum AssociatedVehicleType {
    case vehicles
    case starships
}

class AssociatedVehiclesController: UITableViewController {
    let client = SWAPIClient()
    var character: Character?
    var vehicleType: AssociatedVehicleType?
    var dataSource = AssociatedVehiclesDataSource()
    
    @IBOutlet weak var vehicleName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataSource
        
        if vehicleType == .vehicles {
            pullVehicles()
        } else if vehicleType == .starships {
            pullStarships()
        } else {
            fatalError("Vehicle type not supported")
        }
    }
    
    func pullVehicles() {
        guard let vehicleUrls = character?.vehicleUrls else { fatalError("No URLs found") }
        
        for url in vehicleUrls {
            client.getVehicle(fromURL: url) { vehicle, error in
                DispatchQueue.main.async {
                    self.dataSource.update(with: vehicle!)
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func pullStarships() {
        guard let starshipUrls = character?.starshipUrls else { fatalError("No URLs found") }
        
        for url in starshipUrls {
            client.getVehicle(fromURL: url) { vehicle, error in
                DispatchQueue.main.async {
                    self.dataSource.update(with: vehicle!)
                    self.tableView.reloadData()
                }
            }
        }
    }
}
