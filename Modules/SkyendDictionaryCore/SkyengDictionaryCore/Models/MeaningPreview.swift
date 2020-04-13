//
//  MeaningPreview.swift
//  Skyeng Dictionary
//
//  Created by Anastasia Tarasova on 29.02.2020.
//  Copyright © 2020 Anastasia Tarasova. All rights reserved.
//

import Foundation

public struct MeaningPreview: Codable, Identifiable {
    public var id: Int
    public var partOfSpeechCode: SpeechCode
    public var translation: Translation
    public var previewUrl: URL
    public var imageUrl: URL
    public var transcription: String
    public var soundUrl: URL
}
