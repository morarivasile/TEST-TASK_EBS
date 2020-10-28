//
//  ProductResponse.swift
//  EBS_TEST
//
//  Created by Vasile Morari on 28.10.2020.
//

import Foundation

struct ProductResponse: Codable {
    let id: Int
    let title: String
    let shortDescription: String
    let image: String
    let price: Int
    let salePercent: Int?
    let details: String
}
