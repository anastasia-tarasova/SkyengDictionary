//
//  SearchResult.swift
//  Skyeng Dictionary
//
//  Created by Anastasia Tarasova on 28.02.2020.
//  Copyright © 2020 Anastasia Tarasova. All rights reserved.
//

import Foundation

public struct Word: Decodable, Identifiable {
    public var id: Int
    public var text: String
    public var meanings = [MeaningPreview]()
    
    public init(id: Int, text: String, meanings: [MeaningPreview] = []) {
        self.id = id
        self.text = text
        self.meanings = meanings
    }
}
