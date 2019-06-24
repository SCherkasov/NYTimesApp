//
//  SecondViewController.swift
//  NYTimesApp
//
//  Created by Stanislav Cherkasov on 5/29/19.
//  Copyright © 2019 Stanislav Cherkasov. All rights reserved.
//

import UIKit
import Alamofire

class SecondViewController: UIViewController, NewsDelegate {
  
  @IBOutlet var secondTableView: UITableView!
  
  var news: [String] = []
  var newsSerice = NewsService()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let nib = UINib(nibName: "SecondTableViewCell", bundle: nil)
    
    secondTableView.register(nib, forCellReuseIdentifier: "cell")
    
    newsSerice.delegate = self
    
    newsSerice.loadMostSharedUrl()
  }
  
  func newsLoaded(_ news: [String]) {
    self.news = news
    
    secondTableView.reloadData()
  }
}

extension SecondViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView,
                 numberOfRowsInSection section: Int) -> Int {
    return self.news.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell",
                                             for: indexPath) as! SecondTableViewCell
    
    cell.secondLabel.text = self.news[indexPath.row]
    
    return cell
  }
  
}
