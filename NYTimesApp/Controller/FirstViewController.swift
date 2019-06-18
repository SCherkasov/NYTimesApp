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
  
  var newArray = [String]()
  var array = ["1", "2", "3"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let nib = UINib(nibName: "FirstTableViewCell", bundle: nil)
    
    firstTableView.register(nib, forCellReuseIdentifier: "cell")
    
    let urlString = "https://api.nytimes.com/svc/mostpopular/v2/viewed/1.json?api-key=MjXoOXYJ1lCIXHaEQZMZwg1yFCGKQzr7"
    
    AF.request(urlString).responseJSON { response in
      
      if let json = response.value {
        let jsonDict = json as! Dictionary<String, Any>
        let captinJs = jsonDict["results"] as! Array<Dictionary<String, Any>>
        
        for i in captinJs {
          self.newArray.append(i["title"] as! String)
          print(self.newArray.last!)
          
        }
        self.firstTableView.reloadData()
      }
      
    }
    print("Loading")
    
  }
}

extension FirstViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection
                                            section: Int) -> Int {
    return newArray.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell",
                                             for: indexPath) as! FirstTableViewCell
    
    cell.firstLabel.text = newArray[indexPath.row]
    
    return cell
  }
  
}
