//
//  ThirdViewController.swift
//  NYTimesApp
//
//  Created by Stanislav Cherkasov on 5/29/19.
//  Copyright © 2019 Stanislav Cherkasov. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
  

  @IBOutlet var thirdTableView: UITableView!
  
  
  var array = ["7", "8", "9"]

    override func viewDidLoad() {
        super.viewDidLoad()

      let nib = UINib(nibName: "ThirdTableViewCell", bundle: nil)
      
      thirdTableView.register(nib, forCellReuseIdentifier: "cell")
    }
}

extension ThirdViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return array.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ThirdTableViewCell
    
    cell.thirdLabel.text = array[indexPath.row]
    
    return cell
  }
  
  
}
