//
//  Meaning.swift
//  Skyeng Dictionary
//
//  Created by Anastasia Tarasova on 28.02.2020.
//  Copyright © 2020 Anastasia Tarasova. All rights reserved.
//

import Foundation

public struct Meaning: Identifiable, Decodable {
    public var id: String
    
    /// Word is a group of meanings. We combine meanings by word entity.
    public var wordId: Int
    
    public var difficultyLevel: DifficultyLevel?
    
    public var partOfSpeechCode: SpeechCode
    
    // TODO: See if this can be an enum
    /// Infinitive particle (to) or articles (a, the).
    public var prefix: String?
    
    /// Meaning text
    public var text: String
    
    /// URL to meaning sound
    public var soundURL: URL?
    
    /// IPA Phonetic transcription
    public var transcription: String
    
    /// "2019-11-19 15:12:05"
    public var updatedAt: Date?
    
    public var mnemonics: String?
    
    public var translation: Translation
    
    public var properties: Meaning.Properties
    
    public var images = [Meaning.Image]()
    
    public var meaningsWithSimilarTranslations = [Meaning]()
    
    public var alternativeTranslations = [Translation]()
    
    public var examples = [Meaning.Example]()
    
    public var meaningsWithSimilarTranslation = [Meaning.SimilarMeaning]()
    
    static let dateFormatter: DateFormatter = .serverDateFormatter
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decode(String.self, forKey: .id)
        self.wordId = try container.decode(Int.self, forKey: .wordId)
        self.difficultyLevel = try container.decodeIfPresent(DifficultyLevel.self, forKey: .difficultyLevel)
        self.partOfSpeechCode = try container.decode(SpeechCode.self, forKey: .partOfSpeechCode)
        self.prefix = try container.decodeIfPresent(String.self, forKey: .prefix)
        self.text = try container.decode(String.self, forKey: .text)
        self.soundURL = try container.decodeIfPresent(URL.self, forKey: .soundUrl)
        self.transcription = try container.decode(String.self, forKey: .transcription)
        
        if let updatedAtString = try container.decodeIfPresent(String.self, forKey: .updatedAt) {
            self.updatedAt = Self.dateFormatter.date(from: updatedAtString)
        }
        
        self.mnemonics = try container.decodeIfPresent(String.self, forKey: .mnemonics)
        self.translation = try container.decode(Translation.self, forKey: .translation)
        
        self.images = try container.decode([Throwable<Meaning.Image>].self, forKey: .images).compactMap { $0.value }
        
        self.properties = try container.decode(Meaning.Properties.self, forKey: .properties)
        
        self.alternativeTranslations = try container.decodeIfPresent([Throwable<Translation>].self,
                                                                     forKey: .alternativeTranslations)?
            .compactMap { $0.value } ?? []
        
        self.examples = try container.decode([Throwable<Meaning.Example>].self, forKey: .examples).compactMap { $0.value }
        
        self.meaningsWithSimilarTranslation = try container.decode([Throwable<Meaning.SimilarMeaning>].self, forKey: .meaningsWithSimilarTranslation).compactMap { $0.value }
    }
    
    enum CodingKeys: String, CodingKey
    {
        case id
        case wordId
        case difficultyLevel
        case partOfSpeechCode
        case prefix
        case text
        case soundUrl
        case transcription
        case properties
        case updatedAt
        case mnemonics
        case translation
        case images
        case definition
        case examples
        case meaningsWithSimilarTranslation
        case alternativeTranslations
    }
}

extension Meaning
{
    public struct Properties: Codable {
        public var collocation: Bool?
        public var irregular: Bool?
        public var transitivity: String?
        public var linkingVerb: Bool?
        public var phrasalVerb: Bool?
        //var falseFriends = [String]()
    }
    
    public struct Image: Codable {
        var url: URL
    }
    
    public struct Example: Codable {
        public var text: String
        public var soundUrl: URL
    }
    
    public struct SimilarMeaning: Decodable, Identifiable {
        public var id: Int
        
        @Constrained(0.0...100.0)
        public var frequencyPercent: Double = 0.0
        
        public let partOfSpeechAbbreviation: String

        public let translation: Translation
        
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            self.id = try container.decode(Int.self, forKey: .meaningId)
            self.partOfSpeechAbbreviation = try container.decode(String.self, forKey: .partOfSpeechAbbreviation)
            self.translation = try container.decode(Translation.self, forKey: .translation)
            self.frequencyPercent = try container.decode(Double.self, forKey: .frequencyPercent)
            
        }
        
        enum CodingKeys: String, CodingKey {
            case meaningId
            case frequencyPercent
            case partOfSpeechAbbreviation
            case translation
        }
    }
}
