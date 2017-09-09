//
//  EntityTableViewDataSource.swift
//  API Awaken
//
//  Created by Rohit Devnani on 9/9/17.
//  Copyright © 2017 Rohit Devnani. All rights reserved.
//

import UIKit

protocol EntityTableViewDataSource {
    var entity: Entity? { get set }
    var numberOfRows: CGFloat { get set }
    var heightOfRows: CGFloat { get set }
}

extension EntityTableViewDataSource {
    func heightForTableView() -> CGFloat {
        return heightOfRows * numberOfRows
    }
}

