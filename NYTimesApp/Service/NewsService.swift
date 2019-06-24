//
//  Network.swift
//  NYTimesApp
//
//  Created by Stanislav Cherkasov on 6/18/19.
//  Copyright © 2019 Stanislav Cherkasov. All rights reserved.
//

import Foundation
import Alamofire

protocol NewsDelegate {
  func newsLoaded(_ news: [String], _ dateOfPost: [String])
}

class NewsService {
  
  var delegate: NewsDelegate?
  
  private static let mostEmailedUrl = "https://api.nytimes.com/svc/mostpopular/v2/viewed/1.json?api-key=MjXoOXYJ1lCIXHaEQZMZwg1yFCGKQzr7"
  
  private static let mostSharedUrl = "https://api.nytimes.com/svc/mostpopular/v2/shared/30.json?api-key=MjXoOXYJ1lCIXHaEQZMZwg1yFCGKQzr7"
  
  private static let mostViewedUrl = "https://api.nytimes.com/svc/mostpopular/v2/viewed/30.json?api-key=MjXoOXYJ1lCIXHaEQZMZwg1yFCGKQzr7"
    
  func load(url: String) {
    print("Loading 1")
    
    AF.request(url).responseJSON { response in
      print("Loaded")
      if let json = response.value {
        let jsonDict = json as! Dictionary<String, Any>
        let captinJs = jsonDict["results"] as! Array<Dictionary<String, Any>>
        
        var array: [String] = []
        var publishedDayArray: [String] = []
        
        for i in captinJs {
          array.append(i["title"] as! String)
          print(array.last!)
        }
        
        for i in captinJs {
          publishedDayArray.append(i["published_date"] as! String)
          print(publishedDayArray.last!)
        }
        if let d = self.delegate {
          d.newsLoaded(array, publishedDayArray)
        }
      }
    }
    
    print("Loading 2")
  }
  
  func loadMostEmailedUrl() {
    self.load(url: NewsService.mostEmailedUrl)
  }
  
  func loadMostSharedUrl() {
    self.load(url: NewsService.mostSharedUrl)
  }
  
  func loadMostViewedUrl() {
    self.load(url: NewsService.mostViewedUrl)
  }
}

