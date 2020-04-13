//
//  Throwable.swift
//  Skyeng Dictionary
//
//  Created by Anastasia Tarasova on 29.02.2020.
//  Copyright © 2020 Anastasia Tarasova. All rights reserved.
//

import Foundation

struct Throwable<T: Decodable>: Decodable {
    let result: Result<T, Error>

    init(from decoder: Decoder) throws {
        result = Result(catching: { try T(from: decoder) })
    }
}

extension Throwable {
    var value: T? {
        switch self.result {
        case .failure(_):
            return nil
        case .success(let value):
            return value
        }
    }
}
