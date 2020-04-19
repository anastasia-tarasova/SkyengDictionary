//
//  Translation.swift
//  Skyeng Dictionary
//
//  Created by Anastasia Tarasova on 29.02.2020.
//  Copyright © 2020 Anastasia Tarasova. All rights reserved.
//

import Foundation

struct Translation: Codable {
    var text: String
    var note: String?
    
    // MARK: Codable
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.text = try container.decode(String.self, forKey: .text)
        if
            let note = try container.decodeIfPresent(String.self, forKey: .note),
            note.isEmpty == false
        {
            self.note = note
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(text, forKey: .text)
        try container.encodeIfPresent(note, forKey: .note)
    }
    
    enum CodingKeys: String, CodingKey {
        case text
        case note
    }
}
