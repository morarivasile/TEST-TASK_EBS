//
//  Cellable.swift
//  EBS_TEST
//
//  Created by Vasile Morari on 30.10.2020.
//

import UIKit

protocol Cellable {
    static var id: String { get }
    static var cellNib: UINib { get }
}

extension Cellable {
    static var id: String {
        return String(describing: Self.self)
    }
    
    static var cellNib: UINib {
        return UINib(nibName: id, bundle: nil)
    }
}

extension UITableViewCell: Cellable {}
