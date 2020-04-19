//
//  MeaningPreviewParsingTests.swift
//  SkyengDictionaryCoreTests
//
//  Created by Anastasia Tarasova on 29.02.2020.
//  Copyright © 2020 Anastasia Tarasova. All rights reserved.
//

import Foundation

import XCTest
@testable import SkyengDictionaryCore

class MeaningPreviewParsingTests: XCTestCase {

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
    
    let meaningPreviewString = """
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
    }
    """
    
    func testJSONToMeaningPreviewParsing() throws {
        guard let data = meaningPreviewString.data(using: .utf8) else {
            XCTFail("Failed to convert meaningPreviewString string to data.")
            return
        }
        
        let preview = try JSONDecoder().decode(MeaningPreview.self, from: data)
        print(preview)
    }
}
