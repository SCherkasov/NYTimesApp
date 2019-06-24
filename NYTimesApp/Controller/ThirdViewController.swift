//
//  ThirdViewController.swift
//  NYTimesApp
//
//  Created by Stanislav Cherkasov on 5/29/19.
//  Copyright © 2019 Stanislav Cherkasov. All rights reserved.
//

import UIKit
import Alamofire

class ThirdViewController: UIViewController, NewsDelegate {
  
  @IBOutlet var thirdTableView: UITableView!
  
  var news: [String] = []
  var newsSerice = NewsService()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let nib = UINib(nibName: "ThirdTableViewCell", bundle: nil)
    
    thirdTableView.register(nib, forCellReuseIdentifier: "cell")
    
    newsSerice.delegate = self
    
    newsSerice.loadMostViewedUrl()
    
      }
  
  func newsLoaded(_ news: [String]) {
    self.news = news
    
    thirdTableView.reloadData()
  }
}

extension ThirdViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView,
                 numberOfRowsInSection section: Int) -> Int {
    return self.news.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell",
                                             for: indexPath) as! ThirdTableViewCell
    
    cell.thirdLabel.text = self.news[indexPath.row]
    
    return cell
  }
  
  
}
