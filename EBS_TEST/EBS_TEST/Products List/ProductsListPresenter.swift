//
//  ProductsListPresenter.swift
//  EBS_TEST
//
//  Created by Vasile Morari on 28.10.2020.
//

import Foundation

final class ProductsListPresenter {
    
    weak var view: ProductsListViewProtocol?
    var interactor: ProductsListInteractorProtocol!
    
}

// MARK: - ProductsListPresenterProtocol

extension ProductsListPresenter: ProductsListPresenterProtocol {
    func loadProductsList() {
        interactor.loadProductsList { [weak self]  result in
            DispatchQueue.main.async {
                switch result {
                case let .success(products):
                    self?.view?.productViewModels = products.map(ProductViewModel.init)
                case let .failure(error):
                    self?.view?.presentAlert(with: error.localizedDescription)
                }
            }
        }
    }
}
