//
//  ProductDetailsModuleProtocols.swift
//  EBS_TEST
//
//  Created by Vasile Morari on 30.10.2020.
//

import Foundation

// MARK: - View

protocol ProductDetailsViewProtocol: LoadingViewCompatible {
    var models: [AnyCell] { get set }
}

// MARK: - Presenter

protocol ProductDetailsPresenterProtocol: class {
    func loadProduct()
}

// MARK: - Interactor

protocol ProductDetailsInteractorProtocol: class {
    var isProductFavorite: Bool { get set }
    
    func loadProduct(completion: @escaping (Result<ProductResponse, Error>) -> Void)
}

protocol ProductDetailsInteractorOutputProtocol: class {
    func didStartFetchingProduct()
    func didFinishFetchingProduct()
}

// MARK: - DataService

protocol ProductDetailsDataServiceProtocol: class {
    func getProduct(id: Int, completion: @escaping (Result<ProductResponse, Error>) -> Void)
}
