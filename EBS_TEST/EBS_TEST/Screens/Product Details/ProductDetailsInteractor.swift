//
//  ProductDetailsInteractor.swift
//  EBS_TEST
//
//  Created by Vasile Morari on 30.10.2020.
//

import Foundation

enum ProductDetailsInteractorInputData {
    case productId(Int)
    case productResponse(ProductResponse)
    
    var id: Int {
        switch self {
        case let .productId(id): return id
        case let .productResponse(response): return response.id
        }
    }
}

final class ProductDetailsInteractor {
    var dataService: ProductDetailsDataServiceProtocol!
    weak var output: ProductDetailsInteractorOutputProtocol?
    var favoriteListManager: LocalFavoriteProductListManager?
    
    private var data: ProductDetailsInteractorInputData
    
    var isProductFavorite: Bool {
        get {
            favoriteListManager?.favoriteProductsIdentifiers.contains(data.id) ?? false
        }
        set {
            if newValue {
                favoriteListManager?.saveToFavorite(productIdentifier: data.id)
            } else {
                favoriteListManager?.deleteFromFavorites(productIdentifier: data.id)
            }
        }
    }
    
    init(data: ProductDetailsInteractorInputData) {
        self.data = data
    }
}

// MARK: - ProductDetailsInteractorProtoco

extension ProductDetailsInteractor: ProductDetailsInteractorProtocol {
    func loadProduct(completion: @escaping (Result<ProductResponse, Error>) -> Void) {
        switch data {
        case let .productId(identifier):
            
            output?.didStartFetchingProduct()
            
            dataService.getProduct(id: identifier) { result in
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) { // Testing purpose
                    
                    self.output?.didFinishFetchingProduct()
                    completion(result)
                    
                }
            }
            
        case let .productResponse(productResponse):
            completion(.success(productResponse))
        }
    }
}
