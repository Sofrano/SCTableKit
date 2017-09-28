//
//  SCTableSection.swift
//  RoboClub
//
//  Created by Dmitriy Safarov on 28/09/2017.
//  Copyright © 2017 Dmitriy Safarov. All rights reserved.
//

import Foundation
import UIKit

class SCTableSection {

    private(set) var rows = [Row]()
    
    var headerTitle: String?
    var footerTitle: String?
    var indexTitle: String?
    
    var headerView: UIView?
    var footerView: UIView?
    
    var headerHeight: CGFloat? = nil
    var footerHeight: CGFloat? = nil
    
    open var numberOfRows: Int {
        return rows.count
    }
    
    open var isEmpty: Bool {
        return rows.isEmpty
    }
    
    public init(rows: [Row]? = nil) {
        
        if let initialRows = rows {
            self.rows.append(contentsOf: initialRows)
        }
    }
    
    // MARK: - Public -
    
    func clear() {
        rows.removeAll()
    }
    
    func append(row: Row) {
        append(rows: [row])
    }
    
    func append(rows: [Row]) {
        self.rows.append(contentsOf: rows)
    }
    
    func insert(row: Row, at index: Int) {
        rows.insert(row, at: index)
    }
    
    func insert(rows: [Row], at index: Int) {
        self.rows.insert(contentsOf: rows, at: index)
    }
    
    func replace(rowAt index: Int, with row: Row) {
        rows[index] = row
    }
    
    func delete(rowAt index: Int) {
        rows.remove(at: index)
    }
    
    func remove(rowAt index: Int) {
        rows.remove(at: index)
    }
    
}
