//
//  WordsAPITests.swift
//  SkyengDictionaryCoreTests
//
//  Created by Anastasia Tarasova on 01.03.2020.
//  Copyright © 2020 Anastasia Tarasova. All rights reserved.
//

import Foundation
import Combine

import XCTest
@testable import SkyengDictionaryCore

class WordsAPITests: XCTestCase {

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
    
    let client = WordAPIService()
    
    var subscriptions = Set<AnyCancellable>()
    
    func testSearchWordMeanings() throws {
        let word = "tree"
        
        let expectation = XCTestExpectation()
        client.searchWord(dto: .init(search: word))
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    XCTFail("Failed with error: \(error)")
                case .finished:
                    break
                }
                expectation.fulfill()
            },
                  receiveValue: { words in
                    expectation.fulfill()
            })
            .store(in: &subscriptions)
        
        wait(for: [expectation], timeout: 20.0)
    }
    
    func testGetMeaningsInfo() throws {
        let meaningIds = [117716, 117717, 117718]
        
        let expectation = XCTestExpectation()
        client.getMeanings(dto: .init(ids: meaningIds))
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    XCTFail("Failed with error: \(error)")
                case .finished:
                    break
                }
                expectation.fulfill()
            },
                  receiveValue: { meanings in
                    expectation.fulfill()
            }).store(in: &subscriptions)
        
         wait(for: [expectation], timeout: 20.0)
    }
}
