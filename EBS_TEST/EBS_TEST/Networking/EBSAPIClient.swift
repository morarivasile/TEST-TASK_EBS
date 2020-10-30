//
//  EBSAPIClient.swift
//  EBS_TEST
//
//  Created by Vasile Morari on 28.10.2020.
//

import Foundation

final class EBSAPIClient {
    let session: URLSession
    
    init(session: URLSession = URLSession(configuration: .default)) {
        self.session = session
    }
}

// MARK: - Public API

extension EBSAPIClient: ProductsListDataServiceProtocol {
    func getProducts(offset: Int, limit: Int, completion: @escaping (Result<[ProductResponse], Error>) -> Void) {
        do {
            let url = try formURL(string: "http://mobile-test.devebs.net:5000/products", items: [
                URLQueryItem(name: "offset", value: String(offset)),
                URLQueryItem(name: "limit", value: String(limit))
            ])
            
            let resource = Resource<[ProductResponse]>(get: url, decoder: .init(keyDecodingStrategy: .convertFromSnakeCase))
            
            session.load(resource, completion: completion)
        } catch {
            completion(.failure(error))
        }
    }
}

// MARK: - ProductDetailsDataServiceProtocol

extension EBSAPIClient: ProductDetailsDataServiceProtocol {
    func getProduct(id: Int, completion: @escaping (Result<ProductResponse, Error>) -> Void) {
        do {
            let url = try formURL(string: "http://mobile-test.devebs.net:5000/product", items: [
                URLQueryItem(name: "id", value: String(id))
            ])
            
            let resource = Resource<ProductResponse>(get: url, decoder: .init(keyDecodingStrategy: .convertFromSnakeCase))
            
            session.load(resource, completion: completion)
        } catch {
            completion(.failure(error))
        }
    }
}

// MARK: - Private API

extension EBSAPIClient {
    private func formURL(string: String, items: [URLQueryItem]) throws -> URL  {
        var compoentns = URLComponents(string: string)
        compoentns?.queryItems = items
        
        if let url = compoentns?.url {
            return url
        } else {
            throw NSError(domain: NSURLErrorDomain, code: 0, userInfo: nil)
        }
    }
}

extension JSONDecoder {
    convenience init(keyDecodingStrategy: KeyDecodingStrategy) {
        self.init()
        self.keyDecodingStrategy = keyDecodingStrategy
    }
}
