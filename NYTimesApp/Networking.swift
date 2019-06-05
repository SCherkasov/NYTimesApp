//
//  Networking.swift
//  NYTimesApp
//
//  Created by Stanislav Cherkasov on 6/4/19.
//  Copyright © 2019 Stanislav Cherkasov. All rights reserved.
//

//import Foundation
//import Alamofire
//
//class Networking {
//  
//  public init() {}
//  
//  typealias webServiceResponse = ([[String: Any]]?, Error?) -> Void
//  
//  func execute(_ url: URL, completion: @escaping webServiceResponse) {
//    
//    var urlRequest = URLRequest(url: url)
//    urlRequest.httpMethod = "PUT"
//    
//    AF.request(urlRequest)
//    
//    AF.request(url).validate().responseJSON { response in
//      if let error = response.error {
//        completion(nil, error)
//      } else if let jsonArray = response.result as? [[String: Any]] {
//        completion(jsonArray, nil)
//      } else if let jsonDict = response.result as? [String: Any] {
//        completion([jsonDict], nil)
//      }
//    }
//  }
//}
