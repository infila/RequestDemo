//
//  GithubDataManager.swift
//  RequestDemo
//
//  Created by James Chen on 2021/4/1.
//

import UIKit

class GithubDataManager {
  typealias GitData = (Date, String)

  static let UPDATE_NOTIFICATION = "UPDATE_NOTIFICATION"
  static let shared = GithubDataManager()

  func start() {
    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
      self.timer.fire()
    }
  }

  func invalidate() {
    timer.invalidate()
  }

  private(set) var urlPath: String = "https://api.github.com"
  private(set) var historyData: [GitData] = []
  private(set) var lastData: GitData?

  private init() {
    loadHistory()
  }
}

private extension GithubDataManager {
  var baseDirectory: String {
    return "/GitData"
  }

  func save(_ data: Data) {
    let fileName = baseDirectory + "/\(Date().timeMills)"
    JcPersistantCenter.shared.save(data: data, toFile: fileName)
  }

  func loadHistory() {
    if !JcPersistantCenter.shared.fileExists(baseDirectory) {
      return
    }
    let fileNames = JcPersistantCenter.shared.fileNames(inFolder: baseDirectory).sorted { (s1, s2) -> Bool in
      Int64(s1) ?? 0 < Int64(s2) ?? 0
    }
    for fileName in fileNames {
      guard let data = JcPersistantCenter.shared.loadData(fromFile: baseDirectory + "/" + fileName),
            let dataStr = String(bytes: data, encoding: .utf8),
            let timeMills = Int64(fileName) else {
        assert(false)
        continue
      }
      let date = Date(timeMills: timeMills)
      historyData.append((date, dataStr))
    }
    if historyData.count != 0 {
      lastData = historyData[0]
      historyData.remove(at: 0)
    }
  }

  var timer: Timer {
    let timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(startRequest), userInfo: nil, repeats: true)
    return timer
  }

  @objc func startRequest() {
    JcRequstCenter.shared.httpGet(fromUrl: urlPath) { responses, data, _ in
      guard let data = data,
            let result = String(bytes: data, encoding: .utf8),
            let responses = responses,
            responses.statusCode == 200 else {
        return
      }
      self.save(data)
      if let lastData = self.lastData {
        self.historyData.insert(lastData, at: 0)
      }
      self.lastData = (Date(), result)
      NotificationCenter.default.post(name: NSNotification.Name(rawValue: GithubDataManager.UPDATE_NOTIFICATION), object: nil)
    }
  }
}
