//
//  ProductsListInteractor.swift
//  EBS_TEST
//
//  Created by Vasile Morari on 28.10.2020.
//

import Foundation

final class ProductsListInteractor {
    var dataService: ProductsListDataServiceProtocol?
    
    private var productList: [ProductResponse] = []
    private var currentPage: Int = 1
    private let pageSize: Int
    
    private var offset: Int {
        return productList.count
    }
    
    private var limit: Int {
        return pageSize
    }
    
    init(pageSize: Int = 10) {
        self.pageSize = pageSize
    }
}

// MARK: - ProductsListInteractorProtocol

extension ProductsListInteractor: ProductsListInteractorProtocol {
    func loadProductsList(completion: @escaping (Result<[ProductResponse], Error>) -> Void) {
        dataService?.getProducts(offset: offset, limit: limit) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case let .success(products):
                self.productList.append(contentsOf: products)
                completion(.success(self.productList))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
