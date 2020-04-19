//
//  WordParsingTests.swift
//  SkyengDictionaryCoreTests
//
//  Created by Anastasia Tarasova on 29.02.2020.
//  Copyright © 2020 Anastasia Tarasova. All rights reserved.
//

import Foundation

import XCTest
@testable import SkyengDictionaryCore

class WordParsingTests: XCTestCase {

    func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    let multipleMeaningsWord = """
    {
        "id": 106,
        "text": "work",
        "meanings": [
          {
            "id": 92180,
            "partOfSpeechCode": "v",
            "translation": {
              "text": "работать",
              "note": "трудиться"
            },
            "previewUrl": "//static.skyeng.ru/image/download/project/dictionary/id/221434/width/96/height/72",
            "imageUrl": "//static.skyeng.ru/image/download/project/dictionary/id/221434/width/640/height/480",
            "transcription": "wɜːk",
            "soundUrl": "//d2fmfepycn0xw0.cloudfront.net?gender=male&accent=british&text=work"
          },
          {
            "id": 92182,
            "partOfSpeechCode": "v",
            "translation": {
              "text": "действовать",
              "note": "оказывать действие; о лекарстве, косметическом средстве"
            },
            "previewUrl": "//static.skyeng.ru/image/download/project/dictionary/id/102871/width/96/height/72",
            "imageUrl": "//static.skyeng.ru/image/download/project/dictionary/id/102871/width/640/height/480",
            "transcription": "wɜːk",
            "soundUrl": "//d2fmfepycn0xw0.cloudfront.net?gender=male&accent=british&text=work"
          },
          {
            "id": 92183,
            "partOfSpeechCode": "v",
            "translation": {
              "text": "работать",
              "note": "функционировать, быть исправным; об устройстве"
            },
            "previewUrl": "//static.skyeng.ru/image/download/project/dictionary/id/192390/width/96/height/72",
            "imageUrl": "//static.skyeng.ru/image/download/project/dictionary/id/192390/width/640/height/480",
            "transcription": "wɜːk",
            "soundUrl": "//d2fmfepycn0xw0.cloudfront.net?gender=male&accent=british&text=work"
          }
        ]
    }
    """
    
    let singleMeaningWord = """
    {
      "id": 118427,
      "text": "electrical work",
      "meanings": [
        {
          "id": 153651,
          "partOfSpeechCode": "n",
          "translation": {
            "text": "электромонтажные работы",
            "note": ""
          },
          "previewUrl": "//static.skyeng.ru/image/download/project/dictionary/id/182312/width/96/height/72",
          "imageUrl": "//static.skyeng.ru/image/download/project/dictionary/id/182312/width/640/height/480",
          "transcription": "ɪˈlɛktrɪkəl wɜːk",
          "soundUrl": "//d2fmfepycn0xw0.cloudfront.net?gender=male&accent=british&text=electrical+work"
        }
      ]
    }
    """
    
    func testSingleMeaningWordParsing() throws {
        guard let data = singleMeaningWord.data(using: .utf8) else {
            XCTFail("Failed to convert singleMeaningWord string to data.")
            return
        }
        
        let _ = try JSONDecoder().decode(Word.self, from: data)
    }
    
    func testMultipleMeaningsWordParsing() throws {
        guard let data = multipleMeaningsWord.data(using: .utf8) else {
            XCTFail("Failed to convert multipleMeaningsWord string to data.")
            return
        }
        
        let _ = try JSONDecoder().decode(Word.self, from: data)
    }
}
