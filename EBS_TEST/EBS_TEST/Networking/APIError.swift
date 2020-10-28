//
//  APIError.swift
//  EBS_TEST
//
//  Created by Vasile Morari on 28.10.2020.
//

import Foundation

enum APIError: Error {
    case requestFailed(cause: String)
    case jsonConversionFailure
    case invalidData
    case jsonParsingFailure
    case unsuccessfulResponse(code: Int)
    
    var description: String {
        switch self {
        case .requestFailed(let desc): return desc
        case .invalidData: return "Invalid Data"
        case .unsuccessfulResponse: return "Unsuccessful Response"
        case .jsonParsingFailure: return "JSON Parsing Failure"
        case .jsonConversionFailure: return "JSON Conversion Failure"
        }
    }
}
