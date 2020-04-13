//
//  MeaningsRequestPerameters.swift
//  Skyeng Dictionary
//
//  Created by Anastasia Tarasova on 01.03.2020.
//  Copyright © 2020 Anastasia Tarasova. All rights reserved.
//

import Foundation

public struct MeaningsRequestParameters: Codable {
    /// Retrieve results from this date. Must be in UTC timezone.
    public var updateAt: Date?
    /// An array of widths of images of meanings. Separated by commas.
    public var imageWidths: [Int] = []
    
    /// A quality of images. From 0 to 100.
    public var imageQuality: Int? = 100
    
    /// An array of meaning ids. Separated by a comma.
    public var ids = [Int]()
    
    public static let dateFormatter: DateFormatter = .serverDateFormatter
    
    public init(ids: [Int], updateAt: Date? = nil, imageQuality: Int? = nil , imageWidths: [Int] = [] ) {
        self.ids = ids
        self.updateAt = updateAt
        self.imageQuality = imageQuality
        self.imageWidths = imageWidths
    }
    
    // MARK: Codable
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if let dateString = try container.decodeIfPresent(String.self, forKey: .updateAt) {
            self.updateAt = Self.dateFormatter.date(from: dateString)
        }
        
        if let widthString = try container.decodeIfPresent(String.self, forKey: .width) {
            let width = widthString.split(separator: ",").compactMap { Int($0) }
            self.imageWidths = width
        }
        
        self.imageQuality = try container.decodeIfPresent(Int.self, forKey: .quality)
        
        if let idsString = try container.decodeIfPresent(String.self, forKey: .ids) {
            let ids = idsString.split(separator: ",").compactMap { Int($0) }
            self.ids = ids
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        if let date = self.updateAt {
            let dateString = Self.dateFormatter.string(from: date)
            try container.encode(dateString, forKey: .updateAt)
        }
        
        if imageWidths.isEmpty == false {
            let string = imageWidths.compactMap{ String($0)}.joined(separator: ",")
            try  container.encode(string, forKey: .width)
        }
        
        try container.encodeIfPresent(imageQuality, forKey: .quality)
        
        if ids.isEmpty == false {
            let string = ids.compactMap{ String($0)}.joined(separator: ",")
            try  container.encode(string, forKey: .ids)
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case updateAt
        case width
        case quality
        case ids
    }
}
