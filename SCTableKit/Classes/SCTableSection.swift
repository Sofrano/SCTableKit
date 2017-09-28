//
//  SCTableSection.swift
//  RoboClub
//
//  Created by Dmitriy Safarov on 28/09/2017.
//  Copyright © 2017 Dmitriy Safarov. All rights reserved.
//

import Foundation
import UIKit

public class SCTableSection {

    private(set) var rows = [Row]()
    
    public var headerTitle: String?
    public var footerTitle: String?
    public var indexTitle: String?
    
    public var headerView: UIView?
    public var footerView: UIView?
    
    public var headerHeight: CGFloat? = nil
    public var footerHeight: CGFloat? = nil
    
    public var numberOfRows: Int {
        return rows.count
    }
    
    public var isEmpty: Bool {
        return rows.isEmpty
    }
    
    public init(rows: [Row]? = nil) {
        
        if let initialRows = rows {
            self.rows.append(contentsOf: initialRows)
        }
    }
    
    // MARK: - Public -
    
    public func clear() {
        rows.removeAll()
    }
    
    public func append(row: Row) {
        append(rows: [row])
    }
    
    public func append(rows: [Row]) {
        self.rows.append(contentsOf: rows)
    }
    
    public func insert(row: Row, at index: Int) {
        rows.insert(row, at: index)
    }
    
    public func insert(rows: [Row], at index: Int) {
        self.rows.insert(contentsOf: rows, at: index)
    }
    
    public func replace(rowAt index: Int, with row: Row) {
        rows[index] = row
    }
    
    public func delete(rowAt index: Int) {
        rows.remove(at: index)
    }
    
    public func remove(rowAt index: Int) {
        rows.remove(at: index)
    }
    
}
