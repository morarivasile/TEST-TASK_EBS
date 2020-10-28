//
//  ProductListTableViewCell.swift
//  EBS_TEST
//
//  Created by Vasile Morari on 28.10.2020.
//

import UIKit

extension UITableViewCell {
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
}

final class ProductListTableViewCell: UITableViewCell {
    
}

extension UITableView {
    func registerCells(classes: [AnyClass]) {
        for cl in classes {
            let cellName = String(describing: cl.self)
            let cellNib = UINib(nibName: cellName, bundle: nil)
            register(cellNib, forCellReuseIdentifier: cellName)
        }
    }
}
