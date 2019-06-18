//
//  SecondViewController.swift
//  NYTimesApp
//
//  Created by Stanislav Cherkasov on 5/29/19.
//  Copyright © 2019 Stanislav Cherkasov. All rights reserved.
//

import UIKit
import Alamofire

class SecondViewController: UIViewController {
  
  @IBOutlet var secondTableView: UITableView!
  
  var mastSharedArray = [String]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let nib = UINib(nibName: "SecondTableViewCell", bundle: nil)
    
    secondTableView.register(nib, forCellReuseIdentifier: "cell")
    
    let mostSharedUrl = "https://api.nytimes.com/svc/mostpopular/v2/shared/30.json?api-key=MjXoOXYJ1lCIXHaEQZMZwg1yFCGKQzr7"
    
    AF.request(mostSharedUrl).responseJSON { response in
      
      if let json = response.value {
        let jsonDict = json as! Dictionary<String, Any>
        let captinJs = jsonDict["results"] as! Array<Dictionary<String, Any>>
        
        for i in captinJs {
          self.mastSharedArray.append(i["title"] as! String)
          print(self.mastSharedArray.last!)
          
        }
        self.secondTableView.reloadData()
      }
      
    }
    print("Loading")
  }
}

extension SecondViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView,
                 numberOfRowsInSection section: Int) -> Int {
    return mastSharedArray.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell",
                                             for: indexPath) as! SecondTableViewCell
    
    cell.secondLabel.text = mastSharedArray[indexPath.row]
    
    return cell
  }
  
}
