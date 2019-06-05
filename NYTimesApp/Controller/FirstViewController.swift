//
//  FirstViewController.swift
//  NYTimesApp
//
//  Created by Stanislav Cherkasov on 5/29/19.
//  Copyright © 2019 Stanislav Cherkasov. All rights reserved.
//

import UIKit
import Alamofire

struct All: Decodable {
  let status: String?
  let copyright: String?
  let num_results: Int?
  let results: [Results]
}

struct Results: Decodable {
  let url: String?
  let adx_keywords: String?
  let column: Int?
  let section: String?
  let byline: String?
  let type: String?
  let title: String?
  let abstract: String?
  let published_date: String?
  let source: String?
  let id: Int?
  let asset_id: Int?
  let views: Int?
  let des_facet: [String]
  let org_facet: [String]
  let per_facet: String
  let geo_facet: [String]
  let media: [Media]
  let uri: String
}

struct Media: Decodable {
  let type: String?
  let subtype: String?
  let caption: String?
  let copyright: String?
  let approved_for_syndication: Int?
  let media_metadata: [Metadata]
}

struct Metadata: Decodable {
  let url: String?
  let format: String?
  let height: Int?
  let width: Int?
}

class FirstViewController: UIViewController {
  
  @IBOutlet var firstTableView: UITableView!
  
 // var newArray = [All]()
  var array = ["1", "2", "3"]

    override func viewDidLoad() {
        super.viewDidLoad()

      let nib = UINib(nibName: "FirstTableViewCell", bundle: nil)
      
      firstTableView.register(nib, forCellReuseIdentifier: "cell")

      let urlString = "https://api.nytimes.com/svc/mostpopular/v2/viewed/1.json?api-key=MjXoOXYJ1lCIXHaEQZMZwg1yFCGKQzr7"
      
      AF.request(urlString).responseJSON { response in
        //print(response)
        
        if let json = response.value {
          let jsonDict = json as! Dictionary<String, Any>
          let captinJs = jsonDict["results"] as! Array<Dictionary<String, Any>>
          print(captinJs)
          let abstrJs = captinJs["title"] as! Array<Any>
          print(abstrJs)
        }
        
      }
print("Loading")
//      guard let url = URL(string: urlString) else { return }
//
//      URLSession.shared.dataTask(with: url) { (data, response, error) in
//        guard let data = data else { return }
      
        ///
//        let dataString = String(data: data, encoding: .utf8)
//        print(dataString)
        ///
//        do {
//          guard let jsonJ = try JSONDecoder().decode(All.self, from: data) as? [String: Any] else { return }
//          print(jsonJ)
//        } catch let jsonErr{
//          print("error serialization",jsonErr)
//        }
//        ///
//      }.resume()
//  }
//        do {
//          let json = try JSONDecoder().decode([All].self, from: data)
//          print(json)
//        } catch {
//          print(error.localizedDescription)
//        }
//      }.resume()
//}
}
}

extension FirstViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return array.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FirstTableViewCell
    
    cell.firstLabel.text = array[indexPath.row]
    
    return cell
  }
  
}
