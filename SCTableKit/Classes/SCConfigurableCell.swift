//
//  SCConfigurableCell.swift
//  RoboClub
//
//  Created by Dmitriy Safarov on 28/09/2017.
//  Copyright © 2017 Dmitriy Safarov. All rights reserved.
//

import Foundation
import UIKit

public protocol ConfigurableCell {
    
    associatedtype T
    
    static var reuseIdentifier: String { get }
    static var estimatedHeight: CGFloat? { get }
    static var defaultHeight: CGFloat? { get }
    
    func configure(with _: T)
}

public extension ConfigurableCell where Self: UITableViewCell {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
    static var estimatedHeight: CGFloat? {
        return nil
    }
    
    static var defaultHeight: CGFloat? {
        return nil
    }
}

