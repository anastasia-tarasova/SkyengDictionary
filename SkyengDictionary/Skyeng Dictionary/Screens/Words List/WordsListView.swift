//
//  WordsListView.swift
//  Skyeng Dictionary
//
//  Created by Anastasia Tarasova on 01.03.2020.
//  Copyright © 2020 Anastasia Tarasova. All rights reserved.
//

import Foundation
import SwiftUI
import Resolver
import Combine
import SkyengDictionaryUI

struct WordsListView: View {
    @EnvironmentObject var viewModel: WorldsListViewModel
    
    var body: some View {
        Group {
            if viewModel.words.isEmpty {
                noResultView
            } else {
                VStack {
                    searchBar
                    wordsList
                }
            }
        }.onAppear() {
            self.viewModel.loadNextPage()
        }
    }
    
    var searchBar: some View {
        SearchBar(searchTextWrapper: viewModel.searchTextWrapper, placeholder: "Word")
    }
    
    var wordsList: some View {
        List {
            ForEach(Array(self.viewModel.words.enumerated()), id: \.element.id) { pair in
                
                VStack(alignment: .leading) {
                    Group {
                        Text(pair.element.text)
                    }.onAppear() {
                        if self.viewModel.words.isLast(pair.element) && self.viewModel.canLoadNextPage {
                            self.viewModel.loadNextPage()
                        }
                    }
                    if self.viewModel.isPageLoading && self.viewModel.words.isLast(pair.element) {
                        Divider()
                        Text("Loading...")
                            .padding(.vertical)
                    }
                }
            }
        }.resignKeyboardOnDragGesture()
    }
    
    var noResultView: some View {
        Text("No results")
            .foregroundColor(.gray)
    }
}

// MARK: - Previews
#if DEBUG
struct WordsListView_Previews: PreviewProvider {
    
    static var previews: some View {
        let model = WorldsListViewModel()
        model.words = [.init(id: 1, text: "First"), .init(id: 2, text: "Second")]
        
        let view = WordsListView()
            .environmentObject(model)
        return view
    }
}
#endif
