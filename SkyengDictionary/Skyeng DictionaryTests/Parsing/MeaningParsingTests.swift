//
//  MeaningParsingTests.swift
//  SkyengDictionaryCoreTests
//
//  Created by Anastasia Tarasova on 29.02.2020.
//  Copyright © 2020 Anastasia Tarasova. All rights reserved.
//

import Foundation

import XCTest
@testable import SkyengDictionaryCore

class MeaningParsingTests: XCTestCase {

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
    
    let meaning = #"""
    {
      "id": "92180",
      "wordId": 106,
      "difficultyLevel": 1,
      "partOfSpeechCode": "v",
      "prefix": "to",
      "text": "work",
      "soundUrl": "//d2fmfepycn0xw0.cloudfront.net?gender=male&accent=british&text=work",
      "transcription": "wɜːk",
      "properties": {
        "collocation": false,
        "irregular": false,
        "transitivity": "i",
        "linkingVerb": false,
        "phrasalVerb": false,
        "falseFriends": []
      },
      "updatedAt": "2020-02-16 12:59:24",
      "mnemonics": "Весь <en>увэк</en> (век) <ru>работай </ru>- не заработаешь.",
      "translation": {
        "text": "работать",
        "note": "трудиться"
      },
      "images": [
        {
          "url": "//static.skyeng.ru/image/download/project/dictionary/id/221434/width/200/height/150/quality/50"
        }
      ],
      "definition": {
        "text": "To be engaged in an activity in order to achieve a result.",
        "soundUrl": "//d2fmfepycn0xw0.cloudfront.net?gender=male&accent=british&text=to+be+engaged+in+an+activity+in+order+to+achieve+a+result"
      },
      "examples": [
        {
          "text": "The new contracts force the employees to [work] longer hours.",
          "soundUrl": "//d2fmfepycn0xw0.cloudfront.net?gender=male&accent=british&text=The+new+contracts+force+the+employees+to+work+longer+hours."
        },
        {
          "text": "To [work] like a horse.",
          "soundUrl": "//d2fmfepycn0xw0.cloudfront.net?gender=male&accent=british&text=to+work+like+a+horse"
        },
        {
          "text": "To [work] like a Trojan.",
          "soundUrl": "//d2fmfepycn0xw0.cloudfront.net?gender=male&accent=british&text=to+work+like+a+Trojan"
        },
        {
          "text": "We’ve been [working] in the garden all afternoon.",
          "soundUrl": "//d2fmfepycn0xw0.cloudfront.net?gender=male&accent=british&text=We%E2%80%99ve+been+working+in+the+garden+all+afternoon."
        },
        {
          "text": "He [works] more efficiently on his own.",
          "soundUrl": "//d2fmfepycn0xw0.cloudfront.net?gender=male&accent=british&text=He+works+more+efficiently+on+his+own."
        }
      ],
      "meaningsWithSimilarTranslation": [
        {
          "meaningId": 92180,
          "frequencyPercent": "28.9",
          "partOfSpeechAbbreviation": "гл.",
          "translation": {
            "text": "работать",
            "note": "трудиться"
          }
        },
        {
          "meaningId": 92173,
          "frequencyPercent": "22.1",
          "partOfSpeechAbbreviation": "сущ.",
          "translation": {
            "text": "труд",
            "note": null
          }
        },
        {
          "meaningId": 92174,
          "frequencyPercent": "18.6",
          "partOfSpeechAbbreviation": "сущ.",
          "translation": {
            "text": "произведение",
            "note": null
          }
        },
        {
          "meaningId": 92182,
          "frequencyPercent": "12.5",
          "partOfSpeechAbbreviation": "гл.",
          "translation": {
            "text": "действовать",
            "note": "оказывать действие; о лекарстве, косметическом средстве"
          }
        },
        {
          "meaningId": 92183,
          "frequencyPercent": "7.8",
          "partOfSpeechAbbreviation": "гл.",
          "translation": {
            "text": "работать",
            "note": "функционировать, быть исправным; об устройстве"
          }
        },
        {
          "meaningId": 92175,
          "frequencyPercent": "6.6",
          "partOfSpeechAbbreviation": "сущ.",
          "translation": {
            "text": "работа",
            "note": null
          }
        },
        {
          "meaningId": 92185,
          "frequencyPercent": "3.5",
          "partOfSpeechAbbreviation": "гл.",
          "translation": {
            "text": "тренировать",
            "note": "тело, мышцы"
          }
        }
      ],
      "alternativeTranslations": [
        {
          "text": "become",
          "translation": {
            "text": "становиться",
            "note": null
          }
        },
        {
          "text": "recall",
          "translation": {
            "text": "вспоминать",
            "note": ""
          }
        },
        {
          "text": "watch",
          "translation": {
            "text": "приглядывать",
            "note": ""
          }
        },
        {
          "text": "struck",
          "translation": {
            "text": "прошедшее время и причастие прошедшего времени глагола \"strike\"",
            "note": ""
          }
        },
        {
          "text": "see",
          "translation": {
            "text": "узнавать",
            "note": null
          }
        },
        {
          "text": "go",
          "translation": {
            "text": "умирать",
            "note": ""
          }
        },
        {
          "text": "look",
          "translation": {
            "text": "выглядеть",
            "note": null
          }
        },
        {
          "text": "smile",
          "translation": {
            "text": "улыбаться",
            "note": null
          }
        },
        {
          "text": "call",
          "translation": {
            "text": "окликать",
            "note": ""
          }
        },
        {
          "text": "choose",
          "translation": {
            "text": "решить",
            "note": "сделать что-либо"
          }
        },
        {
          "text": "laid",
          "translation": {
            "text": "форма прошедшего времени и причастия прошедшего времени глагола 'lay'",
            "note": ""
          }
        },
        {
          "text": "love",
          "translation": {
            "text": "любить",
            "note": ""
          }
        },
        {
          "text": "thank",
          "translation": {
            "text": "благодарить",
            "note": null
          }
        },
        {
          "text": "forget",
          "translation": {
            "text": "забывать ",
            "note": null
          }
        },
        {
          "text": "know",
          "translation": {
            "text": "быть знакомым",
            "note": "с кем-либо"
          }
        },
        {
          "text": "turn",
          "translation": {
            "text": "поворачиваться",
            "note": "корпусом"
          }
        },
        {
          "text": "have",
          "translation": {
            "text": "делать (что-либо) за деньги",
            "note": "заказывать какую-либо работу кому-либо, получить какую-либо услугу за деньги"
          }
        },
        {
          "text": "feel",
          "translation": {
            "text": "чувствовать",
            "note": "иметь чувства"
          }
        },
        {
          "text": "hidden",
          "translation": {
            "text": "причастие прошедшего времени глагола 'hide'",
            "note": ""
          }
        },
        {
          "text": "taught",
          "translation": {
            "text": "форма прошедшего времени и причастия прошедшего времени глагола \"teach\"",
            "note": ""
          }
        }
      ]
    }
    """#
    
    func testMeaningParsing() throws {
        guard let data = meaning.data(using: .utf8) else {
            XCTFail("Failed to convert meaningPreviewString string to data.")
            return
        }
        
        let _ = try JSONDecoder().decode(Meaning.self, from: data)
    }
}

