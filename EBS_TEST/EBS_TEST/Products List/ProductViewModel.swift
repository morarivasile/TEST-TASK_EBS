//
//  ProductViewModel.swift
//  EBS_TEST
//
//  Created by Vasile Morari on 28.10.2020.
//

import Foundation

struct ProductViewModel {
    
    private(set) var product: ProductResponse
    
    var title: String {
        return product.title
    }
    
    var description: String {
        return product.shortDescription
    }
    
    var imageStringURL: String {
        return product.image
    }
    
    var displayPrice: DisplayPrice {
        if let percent = product.salePrecent, percent > 0 {
            let price = product.price - (product.price * percent / 100)
            return .init(price: price, oldPrice: product.price)
        } else {
            return .init(price: product.price, oldPrice: nil)
        }
    }
    
    
    init(_ product: ProductResponse) {
        self.product = product
    }
    
}

// MARK: - DisplayPrice

extension ProductViewModel {
    struct DisplayPrice {
        let price: String
        var oldPrice: String? = nil
        
        init(price: Int, oldPrice: Int?) {
            self.price = "$ \(price)"
            
            if let oldPrice = oldPrice {
                self.oldPrice = "$ \(oldPrice)"
            }
        }
    }
}
