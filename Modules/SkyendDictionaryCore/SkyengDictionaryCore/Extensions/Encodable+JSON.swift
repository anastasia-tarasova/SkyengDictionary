//
//  Encodable.swift
//  Skyeng Dictionary
//
//  Created by Anastasia Tarasova on 01.03.2020.
//  Copyright © 2020 Anastasia Tarasova. All rights reserved.
//

import Foundation

extension Encodable {
    /// Converting object to postable dictionary
    func toDictionary(_ encoder: JSONEncoder = JSONEncoder()) throws -> [String: Any] {
        encoder.outputFormatting = .prettyPrinted
        let data = try encoder.encode(self)
        let object = try JSONSerialization.jsonObject(with: data)
        guard let json = object as? [String: Any] else {
            let context = DecodingError.Context(codingPath: [], debugDescription: "Deserialized object is not a dictionary")
            throw DecodingError.typeMismatch(type(of: object), context)
        }
        return json
    }
    
    func formattedString(_ encoder: JSONEncoder = JSONEncoder()) throws -> String {
        encoder.outputFormatting = .prettyPrinted
        let data = try encoder.encode(self)
        return String(data: data, encoding: .utf8) ?? "nil"
    }
}
