//
//  Definition.swift
//  Skyeng Dictionary
//
//  Created by Anastasia Tarasova on 29.02.2020.
//  Copyright © 2020 Anastasia Tarasova. All rights reserved.
//

import Foundation

struct Definition: Codable, CustomDebugStringConvertible {
    var text: String
    var soundURL: URL?
    
    // MARK: Codable
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.text = try container.decode(String.self, forKey: .text)
        if let urlString = try container.decodeIfPresent(String.self, forKey: .soundURL)
        {
            self.soundURL = URL(string: urlString)
        }
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(text, forKey: .text)
        try container.encodeIfPresent(soundURL?.absoluteString, forKey: .soundURL)
    }
    
    enum CodingKeys: String, CodingKey {
        case text
        case soundURL = "soundUrl"
    }
    
    // MARK: CustomDebugStringConvertible
    var debugDescription: String {
        return """
        text: \(text)
        soundURL: \(soundURL?.debugDescription ?? "nil")
        """
    }
}
