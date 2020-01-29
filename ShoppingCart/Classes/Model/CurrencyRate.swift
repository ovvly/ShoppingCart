//
// Created by Jakub Sowa on 29/01/2020.
// Copyright (c) 2020 Sowa, Jakub. All rights reserved.
//

import Foundation

typealias CurrencyRate = Decimal

struct PairedCurrencyRate: Decodable {
    private let rates: [String: Rate]
    var value: Decimal? {
        guard let firstKey = rates.keys.first else { return nil }
        return rates[firstKey]?.rate
    }
}

private struct Rate: Decodable {
    let rate: Decimal
}