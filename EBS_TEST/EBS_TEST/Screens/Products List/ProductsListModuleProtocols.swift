//
//  ProductsListModuleProtocols.swift
//  EBS_TEST
//
//  Created by Vasile Morari on 28.10.2020.
//

import Foundation

// MARK: - View

protocol ProductsListViewProtocol: class {
    var productViewModels: [ProductViewModel] { get set }
    var shouldShowLoadingStateCell: Bool { get set }
    
    func presentAlert(with title: String?)
}

// MARK: - Presenter

protocol ProductsListPresenterProtocol: class {
    func loadProductsList()
    func didSelectRow(at indexPath: IndexPath)
}

// MARK: - Interactor

protocol ProductsListInteractorProtocol: class {
    func loadProductsList(completion: @escaping (Result<[ProductResponse], Error>) -> Void)
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
    func pushToProductDetailsScreen(with productId: Int)
}
