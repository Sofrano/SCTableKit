//
//  SCTableRow.swift
//  RoboClub
//
//  Created by Dmitriy Safarov on 28/09/2017.
//  Copyright © 2017 Dmitriy Safarov. All rights reserved.
//

import Foundation
import UIKit



public protocol RowConfigurable {
    
    func configure(_ cell: UITableViewCell)
    
}

public protocol RowHashable {
    
    var hashValue: Int { get }
}

public protocol Row: RowConfigurable, RowHashable {
    
    var reuseIdentifier: String { get }
    var cellType: AnyClass { get }
    
    var estimatedHeight: CGFloat? { get }
    var defaultHeight: CGFloat? { get }
    
}


open class TableRow<CellType: ConfigurableCell>: Row where CellType: UITableViewCell {
    
    open let item: CellType.T
    
    open var hashValue: Int {
        return ObjectIdentifier(self).hashValue
    }
    
    open var reuseIdentifier: String {
        return CellType.reuseIdentifier
    }
    
    open var estimatedHeight: CGFloat? {
        return CellType.estimatedHeight
    }
    
    open var defaultHeight: CGFloat? {
        return CellType.defaultHeight
    }
    
    open var cellType: AnyClass {
        return CellType.self
    }
    
    public init(item: CellType.T) {
        self.item = item
    }
    
    // MARK: - RowConfigurable -
    
    open func configure(_ cell: UITableViewCell) {
        (cell as? CellType)?.configure(with: item)
    }
}

