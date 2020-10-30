
//  ProductDetailsViewController.swift
//  EBS_TEST
//
//  Created by Vasile Morari on 28.10.2020.
//

import UIKit

final class ProductDetailsViewController: UIViewController {
    
    @IBOutlet weak private var tableView: UITableView! {
        didSet {
            tableView.registerCells(classes: [
                ImageTableViewCell.self,
                ProductShortInfoTableViewCell.self,
                InformationTableViewCell.self,
                ProductInfoPoints.self
            ])
        }
    }
    
}
