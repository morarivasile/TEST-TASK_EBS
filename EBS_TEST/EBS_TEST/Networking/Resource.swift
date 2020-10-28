//
//  Resource.swift
//  EBS_TEST
//
//  Created by Vasile Morari on 28.10.2020.
//

import Foundation

struct Resource<A> {
    var urlRequest: URLRequest
    let parse: (Data) -> A?
}

extension Resource {
    func map<B>(_ transform: @escaping (A) -> B) -> Resource<B> {
        return Resource<B>(urlRequest: urlRequest) { self.parse($0).map(transform) }
    }
}

extension Resource where A: Decodable {
    init(get url: URL, decoder: JSONDecoder = JSONDecoder()) {
        urlRequest = URLRequest(url: url)
        parse = { data in
            try? decoder.decode(A.self, from: data)
        }
    }
    
    init<Body: Encodable>(url: URL, method: HttpMethod<Body>, decoder: JSONDecoder = JSONDecoder()) {
        urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.method
        
        if case HttpMethod.post(let body) = method {
            urlRequest.httpBody = try? JSONEncoder().encode(body)
        }
        
        parse = { data in
            try? decoder.decode(A.self, from: data)
        }
    }
}

extension URLSession {
    func load<A>(_ resource: Resource<A>, completion: @escaping (Result<A, Error>) -> Void) {
        dataTask(with: resource.urlRequest) { data, response, error in
            if let error = error {
                completion(.failure(APIError.requestFailed(cause: error.localizedDescription)))
                return
            }
            
            if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completion(.failure(APIError.unsuccessfulResponse(code: response.statusCode)))
                return
            }
            
            if let data = data {
                if let resource = resource.parse(data) {
                    completion(.success(resource))
                } else {
                    completion(.failure(APIError.jsonConversionFailure))
                }
            } else {
                completion(.failure(APIError.invalidData))
            }
            
        }.resume()
    }
}
