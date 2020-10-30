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
    weak var router: ProductsListRouterProtocol?
    
    private var presentedProducts: [ProductViewModel] = [] {
        didSet { view?.productViewModels = presentedProducts }
    }
    
}

// MARK: - ProductsListPresenterProtocol

extension ProductsListPresenter: ProductsListPresenterProtocol {
    func loadProductsList() {
        interactor.loadProductsList { [weak self]  result in
            DispatchQueue.main.async {
                switch result {
                case let .success(products):
                    self?.presentedProducts = products.map(ProductViewModel.init)
                case let .failure(error):
                    self?.view?.presentAlert(with: error.localizedDescription)
                }
            }
        }
    }
    
    func didSelectRow(at indexPath: IndexPath) {
        guard indexPath.row < presentedProducts.count else { return }
        
        router?.pushToProductDetailsScreen(with: presentedProducts[indexPath.row].product)
    }
    
    func updateProduct(at indexPath: IndexPath, isFavorite: Bool) {
        let product = presentedProducts[indexPath.row].product
        interactor.updateFavoriteStatusFor(productId: product.id, isFavorite: isFavorite)
    }
    
    func updateFavoritesData() {
        presentedProducts = interactor.getCurrentUpdatedProducts().map(ProductViewModel.init)
    }
}

// MARK: - ProductsListInteractorOutputProtocol

extension ProductsListPresenter: ProductsListInteractorOutputProtocol {
    func didStartFetchingProducts(pageNumber: Int) {
        if pageNumber > 1 {
            view?.shouldShowLoadingStateCell = true
        } else {
            view?.showLoadingView()
        }
    }
    
    func didFinishFetchingProducts(pageNumber: Int) {
        if pageNumber > 1 {
            view?.shouldShowLoadingStateCell = false
        } else {
            view?.hideLoadingView()
        }
    }
}
