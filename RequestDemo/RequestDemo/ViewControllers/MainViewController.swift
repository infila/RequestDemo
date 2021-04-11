//
//  MainViewController.swift
//  RequestDemo
//
//  Created by James Chen on 2021/3/31.
//

import UIKit

class MainViewController: BaseViewController {
  @IBOutlet var urlLabel: UILabel!
  @IBOutlet var timeLabel: UILabel!
  @IBOutlet var contentView: UITextView!

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    refreshAll()
    NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: GithubDataManager.UPDATE_NOTIFICATION), object: nil, queue: OperationQueue.main) { _ in
      self.refreshAll()
    }
  }

  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    NotificationCenter.default.removeObserver(self)
  }
}

private extension MainViewController {
  func refreshAll() {
    urlLabel.text = GithubDataManager.shared.urlPath
    if let lastData = GithubDataManager.shared.lastData {
      timeLabel.text = Utility.dateDisplayFormatNormal(lastData.0)
      contentView.text = lastData.1
    } else {
      timeLabel.text = ""
      contentView.text = ""
    }
  }
}
