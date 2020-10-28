//
//  ProductViewModel.swift
//  EBS_TEST
//
//  Created by Vasile Morari on 28.10.2020.
//

import Foundation

struct ProductViewModel {
    
    let title: String
    
    init(_ product: ProductResponse) {
        self.title = product.title
    }
}
