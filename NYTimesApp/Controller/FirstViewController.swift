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
  
  var delegate: ConnectionDelegate!
  var network = Connection()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let nib = UINib(nibName: "FirstTableViewCell", bundle: nil)
    
    firstTableView.register(nib, forCellReuseIdentifier: "cell")
    
    delegate.connection(url: network.mostEmailedUrl, array: network.mostEmailedArray)
    
  }
  
}

extension FirstViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView,
                 numberOfRowsInSection section: Int) -> Int {
    return network.mostEmailedArray.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell",
                                             for: indexPath) as! FirstTableViewCell
    
    cell.firstLabel.text = network.mostEmailedArray[indexPath.row]
    
    return cell
  }
  
}
