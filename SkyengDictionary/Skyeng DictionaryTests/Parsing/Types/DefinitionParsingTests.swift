//
//  DefinitionParsingTests.swift
//  SkyengDictionaryCoreTests
//
//  Created by Anastasia Tarasova on 29.02.2020.
//  Copyright © 2020 Anastasia Tarasova. All rights reserved.
//

import Foundation

import XCTest
@testable import SkyengDictionaryCore

class DefinitionParsingTests: XCTestCase {

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
    
    let definitionJSONString = """
    {
      "text": "A farm that supplies the needs of a large estate of establishment.",
      "soundUrl": "//d2fmfepycn0xw0.cloudfront.net?gender=male&accent=british&text=a+farm+that+supplies+the+needs+of+a+large+estate+of+establishment"
    }
    """
    
    func testJSONToDefinitionParsing() throws {
        guard let data = definitionJSONString.data(using: .utf8) else {
            XCTFail("Failed to convert definitionJSON string to data.")
            return
        }
        
        let definition = try JSONDecoder().decode(Definition.self, from: data)
        print(definition)
    }
}
