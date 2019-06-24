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
  func connection(url: String, array: [String]) -> [String]
}

class Connection {
  
  let mostEmailedUrl = "https://api.nytimes.com/svc/mostpopular/v2/viewed/1.json?api-key=MjXoOXYJ1lCIXHaEQZMZwg1yFCGKQzr7"
  
  let mostSharedUrl = "https://api.nytimes.com/svc/mostpopular/v2/shared/30.json?api-key=MjXoOXYJ1lCIXHaEQZMZwg1yFCGKQzr7"
  
  let mostViewedUrl = "https://api.nytimes.com/svc/mostpopular/v2/viewed/30.json?api-key=MjXoOXYJ1lCIXHaEQZMZwg1yFCGKQzr7"
  
  var mostEmailedArray = [String]()
  var mastSharedArray = [String]()
  var mostViewedArray = [String]()
  
  func connection(url: String, array: [String]) -> [String] {

    AF.request(url).responseJSON { response in
      if let json = response.value {
        let jsonDict = json as! Dictionary<String, Any>
        let captinJs = jsonDict["results"] as! Array<Dictionary<String, Any>>
        
        for i in captinJs {
          
          array.append(i["title"] as! String)
          print(array.last!)
        }
      }
      
    }
    print("Loading")
    
    return array
  }
}

