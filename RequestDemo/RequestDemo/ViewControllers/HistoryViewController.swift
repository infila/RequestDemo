//
//  HistoryViewController.swift
//  RequestDemo
//
//  Created by James Chen on 2021/4/10.
//

import UIKit

class HistoryViewController: BaseViewController {
  @IBOutlet weak var tableView: UITableView!

  override func viewDidLoad() {
    super.viewDidLoad()
    refreshAll()
  }
}

extension HistoryViewController: UITableViewDelegate, UITableViewDataSource {
  var cellId: String { return "HistoryCell" }
  var cellHeight: CGFloat { return 120 }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return GithubDataManager.shared.historyData.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! HistoryTableViewCell
    let gitData = GithubDataManager.shared.historyData[indexPath.row]
    cell.contentLabel.text = gitData.1
    cell.timeLabel.text = Utility.dateDisplayFormatDetail(gitData.0)
    return cell
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return cellHeight
  }
}

private extension HistoryViewController {
  func refreshAll() {
    tableView.reloadData()
  }
}
