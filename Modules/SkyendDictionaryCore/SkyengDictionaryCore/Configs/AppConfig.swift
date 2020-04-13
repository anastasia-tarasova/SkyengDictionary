//
//  AppState.swift
//  Skyeng Dictionary
//
//  Created by Anastasia Tarasova on 01.03.2020.
//  Copyright © 2020 Anastasia Tarasova. All rights reserved.
//

import Foundation

public protocol AppConfigProtocol {
    var url: AppConfigUrlProtocol { get }
}

public protocol AppConfigUrlProtocol {
    var serverUrl: String { get }
}

public struct AppConfig: AppConfigProtocol {
    
    public static let current: AppConfigProtocol = AppConfig()
    
    public var url: AppConfigUrlProtocol = BaseUrl()
    
    //MARK: Network
    public struct BaseUrl: AppConfigUrlProtocol {
        private let baseUrl = "https://dictionary.skyeng.ru"
        private let apiUrl = "/api/public/v1"
        
        public init(){}
        
        public var serverUrl: String {
            return baseUrl + apiUrl
        }
    }
}
