//
//  HistoryTableViewCell.swift
//  RequestDemo
//
//  Created by James Chen on 2021/4/11.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {
  @IBOutlet weak var contentLabel: UILabel!
  @IBOutlet weak var timeLabel: UILabel!

  override func awakeFromNib() {
    super.awakeFromNib()
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
}
