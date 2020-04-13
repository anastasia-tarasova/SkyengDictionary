//
//  WordAPIService.swift
//  Skyeng Dictionary
//
//  Created by Anastasia Tarasova on 02.03.2020.
//  Copyright © 2020 Anastasia Tarasova. All rights reserved.
//

import Foundation
import Combine
import Moya

public protocol WordAPIServiceProtocol: class {
    func searchWord(dto: WordSearchRequestParameters) -> AnyPublisher<[Word], Error>
    func getMeanings(dto: MeaningsRequestParameters) -> AnyPublisher<[Meaning], Error>
}

public class WordAPIService: WordAPIServiceProtocol {
    private let apiProvider = MoyaProvider<WordAPI>()
    
    public init() {}
    
    public func searchWord(dto: WordSearchRequestParameters) -> AnyPublisher<[Word], Error> {
        return self.request(target: .wordSearch(dto), responseType: [Word].self)
    }
    
    public  func getMeanings(dto: MeaningsRequestParameters) -> AnyPublisher<[Meaning], Error> {
        return self.request(target: .meanings(dto), responseType: [Meaning].self)
    }
}

private extension WordAPIService {
    func request<E: Decodable>(target: WordAPI, responseType: E.Type, jsonDecoder: JSONDecoder = JSONDecoder()) -> AnyPublisher<E, Error> {
        apiProvider.requestPublisher(target)
            .filterSuccessfulStatusCodes()
            .map(E.self, using: jsonDecoder)
            .mapError { $0 }
            .eraseToAnyPublisher()
    }
}
