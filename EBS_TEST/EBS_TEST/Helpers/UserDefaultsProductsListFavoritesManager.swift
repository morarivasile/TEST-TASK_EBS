//
//  UserDefaultsProductsListFavoritesManager.swift
//  EBS_TEST
//
//  Created by Vasile Morari on 30.10.2020.
//

import Foundation

final class UserDefaultsProductsListFavoritesManager: LocalFavoriteProductListManager {
    
    private let userDefaults: UserDefaults
    
    private var savingKey: String = "test_saving_key"
    
    var favoriteProductsIdentifiers: [Int] {
        return _favoriteProductsIdentifiers
    }
    
    private var _favoriteProductsIdentifiers: [Int] {
        get {
            (userDefaults.array(forKey: savingKey) as? [Int]) ?? []
        }
        set {
            userDefaults.setValue(newValue, forKey: savingKey)
        }
    }
    
    init(_ userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
    }
    
    func saveToFavorite(productIdentifier: Int) {
        _favoriteProductsIdentifiers += [productIdentifier]
    }
    
    func deleteFromFavorites(productIdentifier: Int) {
        _favoriteProductsIdentifiers = _favoriteProductsIdentifiers.filter { $0 != productIdentifier}
    }
    
}
