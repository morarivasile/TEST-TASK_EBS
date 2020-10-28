//
//  UIViewController+NibLoaded.swift
//  EBS_TEST
//
//  Created by Vasile Morari on 28.10.2020.
//

import UIKit

extension UIViewController {
    static var nibLoaded: Self {
        return Self.init(nibName: String(describing: Self.self), bundle: nil)
    }
}
