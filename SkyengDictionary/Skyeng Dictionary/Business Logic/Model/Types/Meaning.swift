//
//  Meaning.swift
//  Skyeng Dictionary
//
//  Created by Anastasia Tarasova on 28.02.2020.
//  Copyright © 2020 Anastasia Tarasova. All rights reserved.
//

import Foundation

struct Meaning: Identifiable, Decodable {
    var id: String
    
    /// Word is a group of meanings. We combine meanings by word entity.
    var wordId: Int
    
    var difficultyLevel: DifficultyLevel?
    
    var partOfSpeechCode: SpeechCode
    
    // TODO: See if this can be an enum
    /// Infinitive particle (to) or articles (a, the).
    var prefix: String?
    
    /// Meaning text
    var text: String
    
    /// URL to meaning sound
    var soundURL: URL?
    
    /// IPA Phonetic transcription
    var transcription: String
    
    /// "2019-11-19 15:12:05"
    var updatedAt: Date?
    
    var mnemonics: String?
    
    var translation: Translation
    
    var properties: Meaning.Properties
    
    var images = [Meaning.Image]()
    
    var meaningsWithSimilarTranslations = [Meaning]()
    
    var alternativeTranslations = [Translation]()
    
    var examples = [Meaning.Example]()
    
    var meaningsWithSimilarTranslation = [Meaning.SimilarMeaning]()
    
    static let dateFormatter: DateFormatter = .serverDateFormatter
    
    init(from decoder: Decoder) throws {
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
    struct Properties: Codable {
        var collocation: Bool?
        var irregular: Bool?
        var transitivity: String?
        var linkingVerb: Bool?
        var phrasalVerb: Bool?
        //var falseFriends = [String]()
    }
    
    struct Image: Codable {
        var url: URL
    }
    
    struct Example: Codable {
        var text: String
        var soundUrl: URL
    }
    
    struct SimilarMeaning: Decodable, Identifiable {
        var id: Int
        
        @Constrained(0.0...100.0)
        var frequencyPercent: Double = 0.0
        
        var partOfSpeechAbbreviation: String

        var translation: Translation
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            self.id = try container.decode(Int.self, forKey: .meaningId)
            self.frequencyPercent = try container.decode(Double.self, forKey: .frequencyPercent)
            self.partOfSpeechAbbreviation = try container.decode(String.self, forKey: .partOfSpeechAbbreviation)
            self.translation = try container.decode(Translation.self, forKey: .translation)
            
        }
        
        enum CodingKeys: String, CodingKey {
            case meaningId
            case frequencyPercent
            case partOfSpeechAbbreviation
            case translation
        }
    }
}
