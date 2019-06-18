//
//  Network.swift
//  NYTimesApp
//
//  Created by Stanislav Cherkasov on 6/18/19.
//  Copyright © 2019 Stanislav Cherkasov. All rights reserved.
//

import Foundation
import Alamofire

protocol ConnectionDelegate {
  func wasConnected(_ connected: Connection)
}

class Connection: ConnectionDelegate {
  
  var url: String
  var array: [String]
  var tableView: UITableView!
  
  init(url: String, array: [String], tableView: UITableView!) {
    self.url = url
    self.array = array
    self.tableView = tableView
  }
  
  func wasConnected(_ connected: Connection) {
    var _ = Connection(url: url, array: array, tableView: tableView)
    AF.request(url).responseJSON { response in
      
      if let json = response.value {
        let jsonDict = json as! Dictionary<String, Any>
        let captinJs = jsonDict["results"] as! Array<Dictionary<String, Any>>
        
        for i in captinJs {
          self.array.append(i["title"] as! String)
          print(self.array.last!)
          
        }
        self.tableView.reloadData()
      }
      
    }
    print("Loading")
  }
}

