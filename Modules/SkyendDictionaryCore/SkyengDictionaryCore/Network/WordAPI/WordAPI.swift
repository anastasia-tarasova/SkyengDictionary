//
//  RestAPI.swift
//  Skyeng Dictionary
//
//  Created by Anastasia Tarasova on 01.03.2020.
//  Copyright © 2020 Anastasia Tarasova. All rights reserved.
//

import Foundation
import Moya

enum WordAPI {
    case wordSearch(WordSearchRequestParameters)
    case meanings(MeaningsRequestParameters)
}

extension WordAPI: TargetType {
    
    public var baseURL: URL {
        return URL(string: AppConfig.current.url.serverUrl)!
    }
    
    public var path: String {
        switch self {
        case .wordSearch:
            return "/words/search"
        case .meanings:
            return "/meanings"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .meanings, .wordSearch:
            return .get
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        switch self {
        case .wordSearch(let parameters):
            let dictionary = try! parameters.toDictionary()
            return .requestParameters(parameters: dictionary, encoding: URLEncoding.default)
            
        case .meanings(let parameters):
            let dictionary = try! parameters.toDictionary()
            return .requestParameters(parameters: dictionary, encoding: URLEncoding.default)
        }
    }
    
    public var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
    
    public var validationType: ValidationType {
        return .successCodes
    }
}
