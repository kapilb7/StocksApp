//
//  StocksTableViewController.swift
//  StocksApp
//
//  Created by Kapil on 30/06/21.
//

import UIKit

class StocksTableViewController: UITableViewController {
    
    var sortSCRIP = UIButton(type: .system)
    var sortLTP = UIButton(type: .system)
    var sortVol = UIButton(type: .system)
    var sortCHG = UIButton(type: .system)
    
    var isSortedAscendingSCRIP = true
    var isSortedAscendingLTP = true
    var isSortedAscendingVol = true
    var isSortedAscendingCHG = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        //        tableView.separatorInset.left = 0
        //        tableView.backgroundColor = .black
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.reloadTableView), name: NSNotification.Name(rawValue: "reloadTableView"), object: nil)
    }
    
    @objc func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return stocksList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stockCell", for: indexPath) as! StockCell
        
        cell.stockName.text = stocksList[indexPath.row]["stockNames"] as! String?
        cell.stockLTP.text = "\(stocksList[indexPath.row]["StockLTP"] as! Int? ?? .zero)"
        cell.stockVolume.text = "\(stocksList[indexPath.row]["StockVolume"] as! Int? ?? .zero)"
        cell.stockPriceChange.text = "\(stocksList[indexPath.row]["StockPriceChange"] as! Double? ?? .zero)"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let frame = tableView.frame
        
        sortSCRIP.setTitle("SCRIP", for: .normal)
        if isSortedAscendingSCRIP {
            sortSCRIP.setImage(UIImage(systemName: "arrow.up.circle.fill"), for: .normal)
        } else {
            sortSCRIP.setImage(UIImage(systemName: "arrow.down.circle.fill"), for: .normal)
        }
        sortSCRIP.setTitleColor(.systemBlue, for: .normal)
        sortSCRIP.frame = CGRect(x: 15, y: 0, width: sortSCRIP.intrinsicContentSize.width, height: sortSCRIP.intrinsicContentSize.height)
        sortSCRIP.addTarget(self, action: #selector(doSortSCRIP), for: .touchUpInside)
        
        sortLTP.setTitle("LTP (₹)", for: .normal)
        if isSortedAscendingLTP {
            sortLTP.setImage(UIImage(systemName: "arrow.up.circle.fill"), for: .normal)
        } else {
            sortLTP.setImage(UIImage(systemName: "arrow.down.circle.fill"), for: .normal)
        }
        sortLTP.setTitleColor(.systemBlue, for: .normal)
        sortLTP.frame = CGRect(x: self.view.frame.width * 0.35, y: sortSCRIP.frame.minY, width: sortLTP.intrinsicContentSize.width, height: sortLTP.intrinsicContentSize.height)
        self.sortLTP.addTarget(self, action: #selector(doSortLTP), for: .touchUpInside)

        sortVol.setTitle("VOL", for: .normal)
        if isSortedAscendingVol {
            sortVol.setImage(UIImage(systemName: "arrow.up.circle.fill"), for: .normal)
        } else {
            sortVol.setImage(UIImage(systemName: "arrow.down.circle.fill"), for: .normal)
        }
        sortVol.setTitleColor(.systemBlue, for: .normal)
        sortVol.frame = CGRect(x: self.view.frame.width * 0.67, y: sortSCRIP.frame.minY, width: sortVol.intrinsicContentSize.width, height: sortVol.intrinsicContentSize.height)
        self.sortVol.addTarget(self, action: #selector(doSortVol), for: .touchUpInside)
        
        sortCHG.setTitle("CHG", for: .normal)
        if isSortedAscendingCHG {
            sortCHG.setImage(UIImage(systemName: "arrow.up.circle.fill"), for: .normal)
        } else {
            sortCHG.setImage(UIImage(systemName: "arrow.down.circle.fill"), for: .normal)
        }
        sortCHG.setTitleColor(.systemBlue, for: .normal)
        sortCHG.frame = CGRect(x: self.view.frame.width * 0.83, y: sortSCRIP.frame.minY, width: sortCHG.intrinsicContentSize.width, height: sortCHG.intrinsicContentSize.height)
        self.sortCHG.addTarget(self, action: #selector(doSortCHG), for: .touchUpInside)
        
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        headerView.backgroundColor = self.view.backgroundColor
        headerView.addSubview(sortSCRIP)
        headerView.addSubview(sortLTP)
        headerView.addSubview(sortVol)
        headerView.addSubview(sortCHG)
        
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return self.view.frame.height * 0.05
    }
    
    @objc func doSortSCRIP() {
        
        if isSortedAscendingSCRIP {
            isSortedAscendingSCRIP = false
            // print(stocksList)
            let sorted = stocksList.sorted { $0["stockNames"] as? String ?? "" > $1["stockNames"] as? String ?? "" }
            //   print(sorted)
            stocksList = sorted
            sortSCRIP.setImage(UIImage(systemName: "arrow.down.circle.fill"), for: .normal)
        } else {
            isSortedAscendingSCRIP = true
            //    print(stocksList)
            let sorted = stocksList.sorted { $0["stockNames"] as? String ?? "" < $1["stockNames"] as? String ?? "" }
            //  print(sorted)
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
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            stocksList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
