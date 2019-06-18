//
//  FirstViewController.swift
//  NYTimesApp
//
//  Created by Stanislav Cherkasov on 5/29/19.
//  Copyright © 2019 Stanislav Cherkasov. All rights reserved.
//

import UIKit
import Alamofire

class FirstViewController: UIViewController {
  
  @IBOutlet var firstTableView: UITableView!
  
  var mostEmailedArray = [String]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let nib = UINib(nibName: "FirstTableViewCell", bundle: nil)
    
    firstTableView.register(nib, forCellReuseIdentifier: "cell")
    
    let mostEmailedUrl = "https://api.nytimes.com/svc/mostpopular/v2/viewed/1.json?api-key=MjXoOXYJ1lCIXHaEQZMZwg1yFCGKQzr7"
    
    AF.request(mostEmailedUrl).responseJSON { response in
      
      if let json = response.value {
        let jsonDict = json as! Dictionary<String, Any>
        let captinJs = jsonDict["results"] as! Array<Dictionary<String, Any>>
        
        for i in captinJs {
          self.mostEmailedArray.append(i["title"] as! String)
          print(self.mostEmailedArray.last!)
          
        }
        self.firstTableView.reloadData()
      }
      
    }
    print("Loading")
    
  }
}

extension FirstViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView,
                 numberOfRowsInSection section: Int) -> Int {
    return mostEmailedArray.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell",
                                             for: indexPath) as! FirstTableViewCell
    
    cell.firstLabel.text = mostEmailedArray[indexPath.row]
    
    return cell
  }
  
}
