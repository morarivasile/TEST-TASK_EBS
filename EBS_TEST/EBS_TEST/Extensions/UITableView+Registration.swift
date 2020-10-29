//
//  UITableView+Registration.swift
//  EBS_TEST
//
//  Created by Vasile Morari on 29.10.2020.
//

import UIKit

extension UITableView {
    func registerCells(classes: [AnyClass]) {
        for cl in classes {
            let cellName = String(describing: cl.self)
            let cellNib = UINib(nibName: cellName, bundle: nil)
            register(cellNib, forCellReuseIdentifier: cellName)
        }
    }
}
