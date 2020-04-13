//
//  WordSearchRequestParameters.swift
//  Skyeng Dictionary
//
//  Created by Anastasia Tarasova on 01.03.2020.
//  Copyright © 2020 Anastasia Tarasova. All rights reserved.
//

import Foundation

public struct WordSearchRequestParameters: Codable {
    public var pageSize: Int?
    public var page: Int?
    /// Word
    public var search: String?
    
    public init(search: String?, pageSize: Int? = nil, page: Int? = nil) {
        self.search = search
        self.pageSize = pageSize
        self.page = page
    }
}
