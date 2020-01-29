//
// Created by Jakub Sowa on 29/01/2020.
// Copyright (c) 2020 Sowa, Jakub. All rights reserved.
//

import Foundation

typealias CurrencyRate = Decimal

struct PairedCurrencyRate {
    var value: Decimal
}

extension PairedCurrencyRate: Decodable {
    private enum CodingKeys: String, CodingKey {
        case rates
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let rates = try values.decode([String: Rate].self, forKey: CodingKeys.rates)

        guard let firstKey = rates.keys.first, let value = rates[firstKey]?.rate else {
            throw NetworkError.parsingError
        }
        self.value = value
    }
}

private struct Rate: Decodable {
    let rate: Decimal
}