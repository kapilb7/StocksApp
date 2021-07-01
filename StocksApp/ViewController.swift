//
//  ViewController.swift
//  StocksApp
//
//  Created by Kapil on 30/06/21.
//

import UIKit

class ViewController: UIViewController {
    
    var sortSCRIP = UIButton(type: .system)
    var sortLTP = UIButton(type: .system)
    var sortVol = UIButton(type: .system)
    var sortCHG = UIButton(type: .system)
    @IBOutlet weak var tableViewContainer: UIView!
    
    var isSortedAscendingSCRIP = false
    var isSortedAscendingLTP = false
    var isSortedAscendingVol = false
    var isSortedAscendingCHG = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        tableViewContainer.layer.borderColor = UIColor.green.cgColor
//        tableViewContainer.layer.borderWidth = 5
        
//        var b = UIButton(configuration: test)
//        b.frame =  CGRect(x: 15, y: tableViewContainer.frame.minY - 50, width: sortSCRIP.intrinsicContentSize.width * 2.5, height: sortSCRIP.intrinsicContentSize.height)
//        b.addTarget(self, action: #selector(doSortSCRIP), for: .touchUpInside)
//        self.view.addSubview(b)
                
        sortSCRIP.setTitle("SCRIP", for: .normal)
        sortSCRIP.setImage(UIImage(systemName: "arrow.up.circle.fill"), for: .normal)
        sortSCRIP.setTitleColor(.systemBlue, for: .normal)
        sortSCRIP.frame = CGRect(x: 15, y: tableViewContainer.frame.minY - 50, width: sortSCRIP.intrinsicContentSize.width, height: sortSCRIP.intrinsicContentSize.height)
//      self.view.addSubview(sortSCRIP)
        sortSCRIP.addTarget(self, action: #selector(doSortSCRIP), for: .touchUpInside)
        
        sortLTP.setTitle("LTP (₹)", for: .normal)
        sortLTP.setImage(UIImage(systemName: "arrow.up.circle.fill"), for: .normal)
        sortLTP.setTitleColor(.systemBlue, for: .normal)
        sortLTP.frame = CGRect(x: self.view.frame.width * 0.25 + 30, y: sortSCRIP.frame.minY, width: sortLTP.intrinsicContentSize.width, height: sortLTP.intrinsicContentSize.height)
//        self.view.addSubview(sortLTP)
        self.sortLTP.addTarget(self, action: #selector(doSortLTP), for: .touchUpInside)

        sortVol.setTitle("Vol", for: .normal)
        sortVol.setImage(UIImage(systemName: "arrow.up.circle.fill"), for: .normal)
        sortVol.setTitleColor(.systemBlue, for: .normal)
        sortVol.frame = CGRect(x: self.view.frame.width * 0.25 + self.view.frame.width * 0.2 + 30 + 30, y: sortSCRIP.frame.minY, width: sortVol.intrinsicContentSize.width, height: sortVol.intrinsicContentSize.height)
//        self.view.addSubview(sortVol)
        self.sortVol.addTarget(self, action: #selector(doSortVol), for: .touchUpInside)
        
        sortCHG.setTitle("CHG", for: .normal)
        sortCHG.setImage(UIImage(systemName: "arrow.up.circle.fill"), for: .normal)
        sortCHG.setTitleColor(.systemBlue, for: .normal)
        sortCHG.frame = CGRect(x: self.view.frame.width * 0.25 + self.view.frame.width * 0.2 + 30 + 30 + self.view.frame.width * 0.1 + 30, y: sortSCRIP.frame.minY, width: sortCHG.intrinsicContentSize.width, height: sortCHG.intrinsicContentSize.height)
//        self.view.addSubview(sortCHG)
        self.sortCHG.addTarget(self, action: #selector(doSortCHG), for: .touchUpInside)
    }
    
    @objc func doSortSCRIP() {
        
        if isSortedAscendingSCRIP {
            isSortedAscendingSCRIP = false
            print(stocksList)
            let sorted = stocksList.sorted { $0["stockNames"] as? String ?? "" > $1["stockNames"] as? String ?? "" }
            print(sorted)
            stocksList = sorted
            sortSCRIP.setImage(UIImage(systemName: "arrow.down.circle.fill"), for: .normal)
        } else {
            isSortedAscendingSCRIP = true
            print(stocksList)
            let sorted = stocksList.sorted { $0["stockNames"] as? String ?? "" < $1["stockNames"] as? String ?? "" }
            print(sorted)
            stocksList = sorted
            sortSCRIP.setImage(UIImage(systemName: "arrow.up.circle.fill"), for: .normal)
        }
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "reloadTableView"), object: nil)
        
    }
    
    @objc func doSortLTP() {
                
        if isSortedAscendingLTP {
            isSortedAscendingLTP = false
            print(stocksList)
            let sorted = stocksList.sorted { $0["StockLTP"] as? Int ?? .zero > $1["StockLTP"] as? Int ?? .zero }
            print(sorted)
            stocksList = sorted
            sortLTP.setImage(UIImage(systemName: "arrow.down.circle.fill"), for: .normal)

        } else {
            isSortedAscendingLTP = true
            print(stocksList)
            let sorted = stocksList.sorted { $0["StockLTP"] as? Int ?? .zero < $1["StockLTP"] as? Int ?? .zero }
            print(sorted)
            stocksList = sorted
            sortLTP.setImage(UIImage(systemName: "arrow.up.circle.fill"), for: .normal)
        }
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "reloadTableView"), object: nil)
        
    }

    @objc func doSortVol() {
        
        if isSortedAscendingVol {
            isSortedAscendingVol = false
            print(stocksList)
            let sorted = stocksList.sorted { $0["StockVolume"] as? Int ?? .zero > $1["StockVolume"] as? Int ?? .zero }
            print(sorted)
            stocksList = sorted
            sortVol.setImage(UIImage(systemName: "arrow.down.circle.fill"), for: .normal)

        } else {
            isSortedAscendingVol = true
            print(stocksList)
            let sorted = stocksList.sorted { $0["StockVolume"] as? Int ?? .zero < $1["StockVolume"] as? Int ?? .zero }
            print(sorted)
            stocksList = sorted
            sortVol.setImage(UIImage(systemName: "arrow.up.circle.fill"), for: .normal)
        }
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "reloadTableView"), object: nil)
        
    }

    @objc func doSortCHG() {
        
        if isSortedAscendingCHG {
            isSortedAscendingCHG = false
            print(stocksList)
            let sorted = stocksList.sorted { $0["StockPriceChange"] as? Double ?? .zero > $1["StockPriceChange"] as? Double ?? .zero }
            print(sorted)
            stocksList = sorted
            sortCHG.setImage(UIImage(systemName: "arrow.down.circle.fill"), for: .normal)
        } else {
            isSortedAscendingCHG = true
            print(stocksList)
            let sorted = stocksList.sorted { $0["StockPriceChange"] as? Double ?? .zero < $1["StockPriceChange"] as? Double ?? .zero }
            print(sorted)
            stocksList = sorted
            sortCHG.setImage(UIImage(systemName: "arrow.up.circle.fill"), for: .normal)
        }
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "reloadTableView"), object: nil)
        
    }

}
