//
//  SCTableKit.swift
//  RoboClub
//
//  Created by Dmitriy Safarov on 28/09/2017.
//  Copyright © 2017 Dmitriy Safarov. All rights reserved.
//

import Foundation
import UIKit

public class SCTableKit: NSObject {
    
    public var sections : [SCTableSection] = []
    public var tableView: UITableView!
    fileprivate var cellRegisterer: TableCellRegisterer?
    
    public init(tableView: UITableView) {
        super.init()
        self.cellRegisterer = TableCellRegisterer(tableView: tableView)
        self.tableView = tableView
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    public func reload() {
        tableView?.reloadData()
    }
    
}

extension SCTableKit: UITableViewDataSource {
    
    // MARK: - Height
    
    open func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        let row = sections[indexPath.section].rows[indexPath.row]
        return row.defaultHeight ?? row.estimatedHeight ??  UITableViewAutomaticDimension
    }
    
    open func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let row = sections[indexPath.section].rows[indexPath.row]
        cellRegisterer?.register(cellType: row.cellType, forCellReuseIdentifier: row.reuseIdentifier)
        return row.defaultHeight ?? UITableViewAutomaticDimension
    }
    
    // MARK: UITableViewDataSource - configuration
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].numberOfRows
    }
    
    open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = sections[indexPath.section].rows[indexPath.row]
        cellRegisterer?.register(cellType: row.cellType, forCellReuseIdentifier: row.reuseIdentifier)
        let cell = tableView.dequeueReusableCell(withIdentifier: row.reuseIdentifier, for: indexPath)
        row.configure(cell)
        return cell
    }
    
    // MARK: UITableViewDataSource - section setup
    
    open func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].headerTitle
    }
    
    open func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return sections[section].footerTitle
    }
    
    // MARK: UITableViewDelegate - section setup
    
    open func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return sections[section].headerView
    }
    
    open func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return sections[section].footerView
    }
    
    open func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let section = sections[section]
        return section.headerHeight ?? section.headerView?.frame.size.height ?? UITableViewAutomaticDimension
    }
    
    open func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        let section = sections[section]
        return section.footerHeight ?? section.footerView?.frame.size.height ?? UITableViewAutomaticDimension
    }
    
}

extension SCTableKit: UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Select IndexPath: \(indexPath.row)")
    }
    
}
