//
//  ResignKeyboardOnDragGesture.swift
//  Skyeng Dictionary
//
//  Created by Anastasia Tarasova on 07.04.2020.
//  Copyright © 2020 Anastasia Tarasova. All rights reserved.
//

#if canImport(SwiftUI)

import Foundation
import SwiftUI

public struct ResignKeyboardOnDragGesture: ViewModifier {
    public var gesture = DragGesture().onChanged{_ in
        UIApplication.shared.endEditing(true)
    }
    
    public func body(content: Content) -> some View {
        content.gesture(gesture)
    }
}


public extension View {
    func resignKeyboardOnDragGesture() -> some View {
        modifier(ResignKeyboardOnDragGesture())
    }
}

#endif
