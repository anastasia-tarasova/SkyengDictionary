//
//  SpeechCode.swift
//  Skyeng Dictionary
//
//  Created by Anastasia Tarasova on 29.02.2020.
//  Copyright © 2020 Anastasia Tarasova. All rights reserved.
//

import Foundation

/**
 Representation of a part of speech
 */
public enum SpeechCode: String, Codable {
    case noun = "n"
    case verb = "v"
    case adjective = "j"
    case adverb = "r"
    case preposition = "prp"
    case pronoun = "prn"
    case cardinalNumber = "crd"
    case conjunction = "cjc"
    case interjection = "exc"
    case article = "det"
    case abbreviation = "abb"
    case particle = "x"
    case ordinalNumber = "ord"
    case modalVerb = "md"
    case phrase = "ph"
    case idiom = "phi"

    // MARK: CustomDebugStringConvertible
}
