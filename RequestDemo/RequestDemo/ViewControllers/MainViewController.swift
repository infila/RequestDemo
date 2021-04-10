//
//  MainViewController.swift
//  RequestDemo
//
//  Created by James Chen on 2021/3/31.
//

import UIKit

class MainViewController: BaseViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: GithubDataManager.UPDATE_NOTIFICATION), object: nil, queue: OperationQueue.main) { (_) in
      self.refreshAll()
    }
  }
}

private extension MainViewController {
  func refreshAll() {
    
  }
}
