
//  ProductDetailsViewController.swift
//  EBS_TEST
//
//  Created by Vasile Morari on 28.10.2020.
//

import UIKit

final class ProductDetailsViewController: UIViewController {
    
    @IBOutlet weak private var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            
            // Register cells
            tableView.registerCells(classes: [
                ImageTableViewCell.self,
                ProductShortInfoTableViewCell.self,
                InformationTableViewCell.self,
                ProductInfoPointsTableViewCell.self
            ])
            
            // Remove last cell separator
            tableView.tableFooterView = UIView(
                frame: CGRect(origin: .zero, size: CGSize(width: tableView.frame.size.width, height: 1))
            )
            
            // Set insets
            tableView.contentInset = .init(top: 0, left: 0, bottom: 30, right: 0)
        }
    }
    
    // Remark: Could
    @IBOutlet weak private var bottomView: UIView! {
        didSet {
            bottomView.layer.shadowColor = UIColor.black.cgColor
            bottomView.layer.shadowOpacity = 0.2
            bottomView.layer.shadowOffset = .zero
            bottomView.layer.shadowRadius = 5
        }
    }
    
    var models: [AnyCell] = [] {
        didSet { tableView.reloadData() }
    }
    
    var presenter: ProductDetailsPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.loadProduct()
    }
    
}

// MARK: - UITableViewDataSource

extension ProductDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return models[indexPath.row].tableViewDequeueReusableCell(tableView)
    }
}

// MARK: - ProductDetailsViewProtocol

extension ProductDetailsViewController: ProductDetailsViewProtocol {
    
}
