//
//  DateFormatter+Formatters.swift
//  Skyeng Dictionary
//
//  Created by Anastasia Tarasova on 01.03.2020.
//  Copyright © 2020 Anastasia Tarasova. All rights reserved.
//

import Foundation

extension DateFormatter {
    static let serverDateFormatter: DateFormatter = {
        $0.dateFormat = "yyyy-mm-dd hh:mm:ss"
        return $0
    }(DateFormatter())
}
