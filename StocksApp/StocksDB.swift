//
//  StocksDB.swift
//  StocksApp
//
//  Created by Kapil on 30/06/21.
//

import Foundation
import UIKit

struct Stocks {
    
    static var stockNames = ["AAPL", "GOOG", "FB", "MSFT", "AMZN", "TWTR", "UBER", "NFLX", "PYPL", "SBUX"]
    static var stockLTP = [136, 2520, 300, 200, 223, 224, 780, 658, 99, 558]
    static var stockVolume = [5517, 431, 2500, 2356, 1287, 8654, 976, 8732, 7912, 9873]
    static var stockPriceChange = ["+0.7", "+0.3", "+0.4", "-0.5", "-0.1", "+0.4", "-0.6", "+0.2", "-0.7", "+0.8"]
    
}

var stocksList = [
    [
        "stockNames" : "AAPL",
        "StockLTP" : 136,
        "StockVolume" : 5517,
        "StockPriceChange" : +0.7
    ],
    [
        "stockNames" : "GOOG",
        "StockLTP" : 2520,
        "StockVolume" : 4500,
        "StockPriceChange" : +0.3
    ],
    [
        "stockNames" : "FB",
        "StockLTP" : 300,
        "StockVolume" : 431,
        "StockPriceChange" : +0.4
    ],
    [
        "stockNames" : "MSFT",
        "StockLTP" : 200,
        "StockVolume" : 2356,
        "StockPriceChange" : -0.5
    ],
    [
        "stockNames" : "AMZN",
        "StockLTP" : 224,
        "StockVolume" : 1287,
        "StockPriceChange" : -0.1
    ],
    [
        "stockNames" : "TWTR",
        "StockLTP" : 223,
        "StockVolume" : 976,
        "StockPriceChange" : +0.1
    ],
    [
        "stockNames" : "NFLX",
        "StockLTP" : 658,
        "StockVolume" : 7912,
        "StockPriceChange" : -0.7
    ]
]

var stocksListTwo = [
    [
        "stockNames" : "AAPL",
        "StockLTP" : 136,
        "StockVolume" : 5517,
        "StockPriceChange" : +0.7
    ],
    [
        "stockNames" : "UBER",
        "StockLTP" : 3476,
        "StockVolume" : 1239,
        "StockPriceChange" : +0.3
    ],
    [
        "stockNames" : "BABA",
        "StockLTP" : 4802,
        "StockVolume" : 235,
        "StockPriceChange" : +0.4
    ],
    [
        "stockNames" : "PYPL",
        "StockLTP" : 150,
        "StockVolume" : 8976,
        "StockPriceChange" : -0.5
    ],
    [
        "stockNames" : "MANU",
        "StockLTP" : 129,
        "StockVolume" : 5640,
        "StockPriceChange" : +0.9
    ],
    [
        "stockNames" : "TSLA",
        "StockLTP" : 765,
        "StockVolume" : 4598,
        "StockPriceChange" : +0.1
    ],
    [
        "stockNames" : "SNAP",
        "StockLTP" : 543,
        "StockVolume" : 4219,
        "StockPriceChange" : -0.7
    ]
]

