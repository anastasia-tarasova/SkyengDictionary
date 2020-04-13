//
//  String+UIKitLocalization.swift
//  SkyengDictionaryUI
//
//  Created by Anastasia Tarasova on 13.04.2020.
//  Copyright © 2020 tarasova. All rights reserved.
//

#if canImport(UIKit)

import Foundation
import UIKit

public extension String {

    /**
     - Returns: Translation provided by iOS or the original tring if translation fails.
     */
    var uiKitLocalized: String {
        let uiKitBundle = Bundle(for: UIApplication.self)
        return uiKitBundle.localizedString(forKey: self, value: "", table: nil)
    }
}

#endif
