//
//  FirstViewController.swift
//  NYTimesApp
//
//  Created by Stanislav Cherkasov on 5/29/19.
//  Copyright © 2019 Stanislav Cherkasov. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
  
  @IBOutlet var firstTableView: UITableView!
  
  var array = ["1", "2", "3"]

    override func viewDidLoad() {
        super.viewDidLoad()

      let nib = UINib(nibName: "FirstTableViewCell", bundle: nil)
      
      firstTableView.register(nib, forCellReuseIdentifier: "cell")
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
