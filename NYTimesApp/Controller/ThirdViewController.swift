//
//  ThirdViewController.swift
//  NYTimesApp
//
//  Created by Stanislav Cherkasov on 5/29/19.
//  Copyright © 2019 Stanislav Cherkasov. All rights reserved.
//

import UIKit
import Alamofire

class ThirdViewController: UIViewController {
  
  @IBOutlet var thirdTableView: UITableView!
  
  var mostViewedArray = [String]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let nib = UINib(nibName: "ThirdTableViewCell", bundle: nil)
    
    thirdTableView.register(nib, forCellReuseIdentifier: "cell")
    
    let mostViewedUrl = "https://api.nytimes.com/svc/mostpopular/v2/viewed/30.json?api-key=MjXoOXYJ1lCIXHaEQZMZwg1yFCGKQzr7"
    
    AF.request(mostViewedUrl).responseJSON { response in
      
      if let json = response.value {
        let jsonDict = json as! Dictionary<String, Any>
        let captinJs = jsonDict["results"] as! Array<Dictionary<String, Any>>
        
        for i in captinJs {
          self.mostViewedArray.append(i["title"] as! String)
          print(self.mostViewedArray.last!)
          
        }
        self.thirdTableView.reloadData()
      }
      
    }
    print("Loading")
  }
  
}

extension ThirdViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView,
                 numberOfRowsInSection section: Int) -> Int {
    return mostViewedArray.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell",
                                             for: indexPath) as! ThirdTableViewCell
    
    cell.thirdLabel.text = mostViewedArray[indexPath.row]
    
    return cell
  }
  
  
}
