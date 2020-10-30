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
}

final class ProductDetailsInteractor {
    var dataService: ProductDetailsDataServiceProtocol!
    weak var output: ProductDetailsInteractorOutputProtocol?
    
    private var data: ProductDetailsInteractorInputData
    
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
