//
//  ProductsListViewController.swift
//  EBS_TEST
//
//  Created by Vasile Morari on 28.10.2020.
//

import UIKit

final class ProductsListViewController: UIViewController {
    
    @IBOutlet weak private var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.prefetchDataSource = self
            tableView.registerCells(classes: [ProductListTableViewCell.self])
        }
    }
    
    var presenter: ProductsListPresenterProtocol!
    
    var productViewModels: [ProductViewModel] = [] {
        didSet { tableView.reloadData() }
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.loadProductsList()
    }
    
    private func isLoadingCell(for indexPath: IndexPath) -> Bool {
        return indexPath.row >= productViewModels.count
    }
}

// MARK: - UITableViewDataSource

extension ProductsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductListTableViewCell.reuseIdentifier, for: indexPath)
        
        if let productCell = cell as? ProductListTableViewCell {
            productCell.textLabel?.text = productViewModels[indexPath.row].title
        }
        
        return cell
    }
}

extension ProductsListViewController: UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        if indexPaths.contains(where: isLoadingCell) {
            presenter.loadProductsList()
        }
    }
}

// MARK: - ProductsListViewProtocol

extension ProductsListViewController: ProductsListViewProtocol {
    func presentAlert(with title: String?) {
        let ac = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        
        present(ac, animated: true)
    }
}
