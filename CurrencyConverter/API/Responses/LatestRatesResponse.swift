//
//  LatestRatesResponse.swift
//  CurrencyConverter
//
//  Created by Gokhan Gultekin on 13.12.2018.
//  Copyright © 2018 Gokhan Gultekin. All rights reserved.
//

import Foundation

public struct LatestRatesResponse: Decodable {
    
    public let date: String
    public let base: String
    public let rates: [String:Double]
}
