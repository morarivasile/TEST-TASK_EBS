//
//  ProductListLoadingTableViewCell.swift
//  EBS_TEST
//
//  Created by Vasile Morari on 30.10.2020.
//

import UIKit

final class ProductListLoadingTableViewCell: UITableViewCell {
    
    @IBOutlet weak private var activityIndicator: UIActivityIndicatorView!
    
    func startAnimating() {
        activityIndicator.startAnimating()
    }
    
}
