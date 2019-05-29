//
//  SecondViewController.swift
//  NYTimesApp
//
//  Created by Stanislav Cherkasov on 5/29/19.
//  Copyright © 2019 Stanislav Cherkasov. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
  
  @IBOutlet var secondTableView: UITableView!
  
  var array = ["4", "5", "6"]

    override func viewDidLoad() {
        super.viewDidLoad()

      let nib = UINib(nibName: "SecondTableViewCell", bundle: nil)
      
      secondTableView.register(nib, forCellReuseIdentifier: "cell")
      
    }
}

extension SecondViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return array.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SecondTableViewCell
    
    cell.secondLabel.text = array[indexPath.row]
    
    return cell
  }
  
  
}
