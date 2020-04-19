//
//  WodrsListViewModel.swift
//  Skyeng Dictionary
//
//  Created by Anastasia Tarasova on 07.04.2020.
//  Copyright © 2020 Anastasia Tarasova. All rights reserved.
//

import Foundation
import Combine
import Resolver
import SkyengDictionaryUI
import SkyengDictionaryCore

class WorldsListViewModel: ObservableObject {

    @Published var searchTextWrapper = WordsSearchTextWrapper()
    
    @Published var isPageLoading = false
    
    @Injected private var wordService: WordAPIServiceProtocol
    
    @Published var words: [Word] = [.init(id: 1, text: "First"), .init(id: 2, text: "Second")]
    
    private var disposables = Set<AnyCancellable>()
    
    func fetchWordsForFilter() {
//        wordService.searchWord(dto: .init(search: word))
//            .receive(on: DispatchQueue.main)
//            .sink(receiveCompletion: { completion in
//
//            },
//                  receiveValue: { [weak self] words in
//                    self?.words = words
//            }).store(in: &disposables)
    }
    
    init () {
        searchTextWrapper.text.publisher.sink { newFilter in
            print("New filter: \(newFilter)")
        }.store(in: &disposables)
    }
    
    var canLoadNextPage: Bool {
        return false
    }
    
    func loadNextPage() {
        
    }
}

final class WordsSearchTextWrapper: SearchTextObservable {
    
    @Published var text: String = ""
    
    override func onUpdateTextDebounced(text: String) {
        self.text = text
    }
}



