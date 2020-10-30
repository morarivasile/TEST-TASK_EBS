//
//  ProductsListModuleProtocols.swift
//  EBS_TEST
//
//  Created by Vasile Morari on 28.10.2020.
//

import Foundation

// MARK: - View

protocol ProductsListViewProtocol: LoadingViewCompatible {
    var productViewModels: [ProductViewModel] { get set }
    var shouldShowLoadingStateCell: Bool { get set }
    
    func presentAlert(with title: String?)
}

// MARK: - Presenter

protocol ProductsListPresenterProtocol: class {
    func loadProductsList()
    func updateFavoritesData()
    func didSelectRow(at indexPath: IndexPath)
    func updateProduct(at indexPath: IndexPath, isFavorite: Bool)
}

// MARK: - Interactor

protocol ProductsListInteractorProtocol: class {
    func loadProductsList(completion: @escaping (Result<[(ProductResponse, Bool)], Error>) -> Void)
    func updateFavoriteStatusFor(productId: Int, isFavorite: Bool)
    func getCurrentUpdatedProducts() -> [(ProductResponse, Bool)]
}

protocol ProductsListInteractorOutputProtocol: class {
    func didStartFetchingProducts(pageNumber: Int)
    func didFinishFetchingProducts(pageNumber: Int)
}

// MARK: - DataService

protocol ProductsListDataServiceProtocol: class {
    func getProducts(offset: Int, limit: Int, completion: @escaping (Result<[ProductResponse], Error>) -> Void)
}

// MARK: - Router

protocol ProductsListRouterProtocol: class {
    func pushToProductDetailsScreen(with productResponse: ProductResponse)
}

protocol LocalFavoriteProductListManager: class {
    var favoriteProductsIdentifiers: [Int] { get }
    
    func saveToFavorite(productIdentifier: Int)
    func deleteFromFavorites(productIdentifier: Int)
}
