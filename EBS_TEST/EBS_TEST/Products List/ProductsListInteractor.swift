//
//  ProductsListInteractor.swift
//  EBS_TEST
//
//  Created by Vasile Morari on 28.10.2020.
//

import Foundation

final class ProductsListInteractor {
    
    // MARK: Public properties
    
    var dataService: ProductsListDataServiceProtocol?
    weak var output: ProductsListInteractorOutputProtocol?
    
    // MARK: Private properties
    
    private var productList: [ProductResponse] = []
    private var canFetchMore: Bool = true
    private var currentPage: Int = 1
    private let pageSize: Int
    
    private var isFetchInProgress = false {
        didSet {
            if isFetchInProgress {
                output?.didStartFetchingProducts(pageNumber: currentPage)
            } else {
                output?.didFinishFetchingProducts(pageNumber: currentPage)
            }
        }
    }
    
    // MARK: Computed properties
    
    private var offset: Int {
        return productList.count
    }
    
    private var limit: Int {
        return pageSize
    }
    
    // MARK: Initializers
    
    init(pageSize: Int = 10) {
        self.pageSize = pageSize
    }
}

// MARK: - ProductsListInteractorProtocol

extension ProductsListInteractor: ProductsListInteractorProtocol {
    func loadProductsList(completion: @escaping (Result<[ProductResponse], Error>) -> Void) {
        guard !isFetchInProgress && canFetchMore else { return }
        
        isFetchInProgress = true
        
        dataService?.getProducts(offset: offset, limit: limit) { [weak self] result in
            guard let self = self else { return }
        
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) { // Testing purpose
                
                self.isFetchInProgress = false
                
                switch result {
                case let .success(products):
                    self.productList.append(contentsOf: products)
                    self.currentPage += 1
                    self.canFetchMore = !(products.count < self.limit)
                    completion(.success(self.productList))
                case let .failure(error):
                    completion(.failure(error))
                }
                
            }
            
        }
    }
}
