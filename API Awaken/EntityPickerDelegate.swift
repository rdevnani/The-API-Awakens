//
//  EntityPickerDelegate.swift
//  API Awaken
//
//  Created by Rohit Devnani on 9/9/17.
//  Copyright © 2017 Rohit Devnani. All rights reserved.
//

import UIKit

class EntityPickerDelegate: NSObject, UIPickerViewDelegate {
    weak var dataSource: EntityPickerDataSource?
    weak var tableView: UITableView?
    weak var titleLabel: UILabel?
    
    override init() {
        super.init()
    }
    
    convenience init(with primaryDataSource: EntityPickerDataSource, tableView: UITableView) {
        self.init()
        self.dataSource = primaryDataSource
        self.tableView = tableView
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        guard let dataSource = dataSource else { fatalError("Delegate cannot be initialized without a data source") }
        return dataSource.entity(at: row).name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        guard var tableViewDataSource = self.tableView?.dataSource as? EntityTableViewDataSource else {
            fatalError("Data source not found on table view")
        }
        
        if let entity = self.dataSource?.entity(at: row), let label = self.titleLabel {
            tableViewDataSource.entity = entity
            self.tableView?.reloadData()
            label.text = entity.name
        }
        
    }
}






