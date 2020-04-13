//
//  OffsetTopPreferenceKey.swift
//  Skyeng Dictionary
//
//  Created by Anastasia Tarasova on 07.04.2020.
//  Copyright © 2020 Anastasia Tarasova. All rights reserved.
//

#if canImport(SwiftUI)

import Foundation
import SwiftUI

public struct OffsetTopPreferenceKey: PreferenceKey {
    static public var defaultValue: CGFloat = 0
    public typealias Value = CGFloat
    
    static public func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

#endif
