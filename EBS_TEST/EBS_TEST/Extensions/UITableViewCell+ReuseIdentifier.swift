//
//  UITableViewCell+ReuseIdentifier.swift
//  EBS_TEST
//
//  Created by Vasile Morari on 29.10.2020.
//

import UIKit

extension UITableViewCell {
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
}

