//
//  UIApplication.swift
//  SkyengDictionaryUI
//
//  Created by Anastasia Tarasova on 13.04.2020.
//  Copyright © 2020 tarasova. All rights reserved.
//

#if canImport(UIKit)

import Foundation
import UIKit

public extension UIApplication {
    func endEditing(_ force: Bool = true) {
        let keyWindow = UIApplication.shared.connectedScenes
                .filter{ $0.activationState == .foregroundActive }
                .map{ $0 as? UIWindowScene }
                .compactMap{ $0 }
                .first?.windows
                .filter{ $0.isKeyWindow }.first
        keyWindow?.endEditing(force)
    }
}

#endif
