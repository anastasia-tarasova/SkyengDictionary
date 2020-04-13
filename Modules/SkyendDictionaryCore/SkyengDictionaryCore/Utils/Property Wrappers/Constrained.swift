//
//  Constrained.swift
//  Skyeng Dictionary
//
//  Created by Anastasia Tarasova on 29.02.2020.
//  Copyright © 2020 Anastasia Tarasova. All rights reserved.
//

import Foundation

@propertyWrapper
public struct Constrained<Value: Comparable> {
    private var range: ClosedRange<Value>
    private var value: Value
    
    public init(wrappedValue value: Value, _ range: ClosedRange<Value>) {
        self.value = value
        self.range = range
    }
    
    public var wrappedValue: Value {
        get {
            return max(min(value, range.upperBound), range.lowerBound)
        }
        set {
            value = newValue
        }
    }
}
