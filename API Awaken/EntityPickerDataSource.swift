//
//  EntityPickerDataSource.swift
//  API Awaken
//
//  Created by Rohit Devnani on 9/9/17.
//  Copyright © 2017 Rohit Devnani. All rights reserved.
//

import UIKit

class EntityPickerDataSource: NSObject, UIPickerViewDataSource {
    private var data = [Entity]()
    
    override init() {
        super.init()
    }
    
    func update(with data: [Entity]) {
        self.data.append(contentsOf: data)
    }
    
    func entity(at index: Int) -> Entity {
        return data[index]
    }
    
    func isEmpty() -> Bool {
        return data.isEmpty
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }
    
    func largestAndSmallestBasedUponLength() -> (largest: Entity, smallest: Entity) {
        var clonedData = [Entity]()
        
        for entity in data {
            if entity.length == "unknown" {
                continue
            }
            
            clonedData.append(entity)
        }
        
        let sorted = clonedData.sorted {
            let length1 = Float($0.length)!
            let length2 = Float($1.length)!
            
            return length1 < length2
        }
        
        return (sorted.first!, sorted.last!)
    }
}

