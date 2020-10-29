//
//  ProductsListViewController.swift
//  EBS_TEST
//
//  Created by Vasile Morari on 28.10.2020.
//

import UIKit

final class ProductsListViewController: UIViewController {
    
    // MARK: IBOutlets
    
    @IBOutlet weak private var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            
            // Register cells
            tableView.registerCells(classes: [
                ProductListTableViewCell.self, ProductListLoadingTableViewCell.self
            ])
            
            // Remove last cell separator
            tableView.tableFooterView = UIView(
                frame: CGRect(origin: .zero, size: CGSize(width: tableView.frame.size.width, height: 1))
            )
        }
    }
    
    // MARK: Public properties
    
    var presenter: ProductsListPresenterProtocol!
    
    var shouldShowLoadingStateCell: Bool = false {
        didSet {
            if shouldShowLoadingStateCell {
                tableView.insertRows(at: [loadingStateCellPosition], with: .none)
            } else {
                tableView.deleteRows(at: [loadingStateCellPosition], with: .none)
            }
        }
    }
    
    var productViewModels: [ProductViewModel] = [] {
        didSet { tableView.reloadData() }
    }
    
    // MARK: Private properties
    
    private var loadingStateCellPosition: IndexPath {
        return IndexPath(row: productViewModels.count, section: 0)
    }
    
    // MARK: VC Lyfecycle
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLeftBarButton(with: "profile_icon")
        setRightBarButton(with: "favorite_empty")
        setNavigationTitleImageView(with: "header")
        presenter.loadProductsList()
    }
    
    // MARK: Private API
    
    private func getReuseIdentifier(for indexPath: IndexPath) -> String {
        if shouldShowLoadingStateCell && indexPath == loadingStateCellPosition {
            return ProductListLoadingTableViewCell.reuseIdentifier
        } else {
            return ProductListTableViewCell.reuseIdentifier
        }
    }
}

// MARK: - UITableViewDataSource

extension ProductsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shouldShowLoadingStateCell ? productViewModels.count + 1 : productViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseIdentifier = getReuseIdentifier(for: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        
        if let productCell = cell as? ProductListTableViewCell {
            productCell.configure(for: productViewModels[indexPath.row])
        }
        
        if let loadingCell = cell as? ProductListLoadingTableViewCell {
            loadingCell.startAnimating()
        }
        
        return cell
    }
}

// MARK: - UITableViewDelegate

extension ProductsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectRow(at: indexPath)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height

        if offsetY > contentHeight - scrollView.frame.height {
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
