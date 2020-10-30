//
//  ProductViewModel.swift
//  EBS_TEST
//
//  Created by Vasile Morari on 28.10.2020.
//

import Foundation

struct DisplayPrice {
    let price: String
    var oldPrice: String? = nil
    
    init(price: Int, salePrecent: Int?) {
        if let percent = salePrecent, percent > 0 {
            self.price = "$ \(price - (price * percent / 100))"
            self.oldPrice = "$ \(price)"
        } else {
            self.price = "$ \(price)"
            self.oldPrice = nil
        }
    }
}

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
        return DisplayPrice(
            price: product.price,
            salePrecent: product.salePrecent
        )
    }
    
    init(_ product: ProductResponse) {
        self.product = product
    }
    
}
