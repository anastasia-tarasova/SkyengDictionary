//
//  Dependensies.swift
//  Skyeng Dictionary
//
//  Created by Anastasia Tarasova on 01.03.2020.
//  Copyright © 2020 Anastasia Tarasova. All rights reserved.
//

import Foundation
import Resolver
import SkyengDictionaryCore

final class Dependencies {
    
    class func registerDependencies() {
        Resolver.register { WordAPIService() as WordAPIServiceProtocol }
    }
}
