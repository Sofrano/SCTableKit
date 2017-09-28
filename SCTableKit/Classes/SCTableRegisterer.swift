//
//  SCTableRegisterer.swift
//  RoboClub
//
//  Created by Dmitriy Safarov on 28/09/2017.
//  Copyright © 2017 Dmitriy Safarov. All rights reserved.
//

import Foundation
import UIKit

class TableCellRegisterer {
    
    private var registeredIds = Set<String>()
    private weak var tableView: UITableView?
    
    init(tableView: UITableView?) {
        self.tableView = tableView
    }
    
    func register(cellType: AnyClass, forCellReuseIdentifier reuseIdentifier: String) {
        
        if registeredIds.contains(reuseIdentifier) {
            return
        }
        
        // check if cell is already registered, probably cell has been registered by storyboard
        if tableView?.dequeueReusableCell(withIdentifier: reuseIdentifier) != nil {
            registeredIds.insert(reuseIdentifier)
            return
        }
        
        let bundle = Bundle(for: cellType)
        
        // we hope that cell's xib file has name that equals to cell's class name
        // in that case we could register nib
        if let _ = bundle.path(forResource: reuseIdentifier, ofType: "nib") {
            tableView?.register(UINib(nibName: reuseIdentifier, bundle: bundle), forCellReuseIdentifier: reuseIdentifier)
            // otherwise, register cell class
        } else {
            tableView?.register(cellType, forCellReuseIdentifier: reuseIdentifier)
        }
        
        registeredIds.insert(reuseIdentifier)
    }
}
