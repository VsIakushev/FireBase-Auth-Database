//
//  StockInfo.swift
//  FireBase Auth Database
//
//  Created by Vitaliy Iakushev on 04.02.2023.
//

import Foundation

struct StockInfo: Identifiable {
    var id: String
    var ticker: String
    var share: Double
    var amount: Double
    var price: Double
    var quantity: Double
}
