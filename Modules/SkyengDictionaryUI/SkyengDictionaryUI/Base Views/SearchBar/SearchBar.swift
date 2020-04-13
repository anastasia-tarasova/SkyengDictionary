//
//  SearchBar.swift
//  Skyeng Dictionary
//
//  Created by Anastasia Tarasova on 07.04.2020.
//  Copyright © 2020 Anastasia Tarasova. All rights reserved.
//

#if canImport(UIKit)

import Foundation
import SwiftUI
import Combine
import UIKit

public struct SearchBar: View {
    
    @ObservedObject public var searchTextWrapper: SearchTextObservable
    public let placeholder: String
    
    @State public var showClearButton = false
    
    /**
     Indicates that search filter is active field has value.
     */
    @Binding public var isSearching: Bool
    
    /**
     Cancel search button title
     */
    public var dismissButtonTitle: String
    public var dismissButtonCallback: (() -> Void)? = {
        UIApplication.shared.endEditing()
    }
    public var alwaysShowClearButton = true
    
    @State private var showCancelButton: Bool = false
    
    private var searchCancellable: Cancellable? = nil
    
    public init(searchTextWrapper: SearchTextObservable,
         placeholder: String = "Search".uiKitLocalized,
         isSearching: Binding<Bool> = .constant(false),
         dismissButtonTitle: String = "Cancel".uiKitLocalized,
         dismissButtonCallback: (() -> Void)? = nil) {
        self.searchTextWrapper = searchTextWrapper
        self.placeholder = placeholder
        self._isSearching = isSearching
        self.dismissButtonTitle = dismissButtonTitle
        if let callback = dismissButtonCallback {
            self.dismissButtonCallback = callback
        }
        
        self.searchCancellable = searchTextWrapper.searchSubject.sink(receiveValue: { value in
            isSearching.wrappedValue = !value.isEmpty
        })
    }
    
    public var onCommit: () ->Void = { print("onCommit") }
    
    public var body: some View {
            HStack(alignment: .center, spacing: 0) {
                HStack {
                    self.searchImage
                    self.textField
                    self.clearButton
                }
                .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
                .foregroundColor(.secondary) // For magnifying glass and placeholder test
                .background(Color(.tertiarySystemFill))
                .cornerRadius(10.0)
            
                if self.showCancelButton {
                    self.cancelButton
                        .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 0))
                }
            }
            .padding(.horizontal)
            .navigationBarHidden(self.showCancelButton)
    }
    
    var searchImage: some View {
        Image(systemName: "magnifyingglass")
    }
    
    var textField: some View {
        TextField(placeholder, text: $searchTextWrapper.searchText, onEditingChanged: { isEditing in
            self.showCancelButton = isEditing
        }, onCommit: onCommit)
        .foregroundColor(.primary)
        .padding(.horizontal)
    }
    
    var clearButton: some View {
        Button(action: {
            if self.searchTextWrapper.searchText.isEmpty == false {
                self.searchTextWrapper.searchText = ""
            }
        }) {
            Image(systemName: "xmark.circle.fill")
                .opacity(self.searchTextWrapper.searchText == "" ? 0 : 1)
        }
    }
    
    var cancelButton: some View {
        Button(action: {
            UIApplication.shared.endEditing(true) // this must be placed before the other commands here
            //self.clearTextField()
            self.dismissButtonCallback?()
        }, label: {
            Text(self.dismissButtonTitle).foregroundColor(Color(.systemBlue))
        })
    }
}

#endif

// MARK: - Previews
#if DEBUG && canImport(SwiftUI)
struct SearchBar_Previews : PreviewProvider {
    static var previews: some View {
        let withText = SearchTextObservable()
        withText.searchText = "Test"
        
        return VStack {
            SearchBar(searchTextWrapper: SearchTextObservable(),
                        placeholder: "Search anything",
                        isSearching: .constant(false))
            SearchBar(searchTextWrapper: withText,
                        placeholder: "Search anything",
                        isSearching: .constant(false))
            
            Spacer()
            
            List {
                SearchBar(searchTextWrapper: withText,
                            placeholder: "Search anything",
                            isSearching: .constant(false))
                Section(header: SearchBar(searchTextWrapper: withText,
                                            placeholder: "Search anything",
                                            isSearching: .constant(false)))
                {
                    SearchBar(searchTextWrapper: withText,
                                placeholder: "Search anything",
                                isSearching: .constant(false))
                }
            }
            
            List {
                SearchBar(searchTextWrapper: withText,
                            placeholder: "Search anything",
                            isSearching: .constant(false))
                Section(header: SearchBar(searchTextWrapper: withText,
                                            placeholder: "Search anything",
                                            isSearching: .constant(false)))
                {
                    SearchBar(searchTextWrapper: withText,
                                placeholder: "Search anything",
                                isSearching: .constant(false))
                }
            }.listStyle(GroupedListStyle())
        }
    }
}
#endif
