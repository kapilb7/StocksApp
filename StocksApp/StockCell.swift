//
//  StockCell.swift
//  StocksApp
//
//  Created by Kapil on 30/06/21.
//

import Foundation
import UIKit

class StockCell: UITableViewCell {
    
    @IBOutlet public weak var stockName: UILabel!
    @IBOutlet public weak var stockLTP: UILabel!
    @IBOutlet public weak var stockVolume: UILabel!
    @IBOutlet public weak var stockPriceChange: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

