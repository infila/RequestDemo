//
//  JcRequstCenter.swift
//  RequestDemo
//
//  Created by James Chen on 2021/3/31.
//

import UIKit

public typealias RequestCompletionHandler = (_ respose: HTTPURLResponse?, _ data: Data?, _ error: Error?) -> Void

public class JcRequstCenter {
  public static let shared = JcRequstCenter()

  public var timeoutInterval = 15.0
  public var operationQueue: OperationQueue {
    let queue = OperationQueue()
    queue.maxConcurrentOperationCount = 3
    return queue
  }

  public func httpGet(fromUrl urlPath: String, parameters: [String: String] = [:], headers: [String: String] = [:], completionHandler: @escaping RequestCompletionHandler) {
    assert(urlPath.hasPrefix("http://") || urlPath.hasPrefix("https://"))
    var urlString = urlPath
    if !parameters.isEmpty {
      urlString = urlPath.url(appendParameters: parameters)
    }
    guard let url = URL(string: urlString) else {
      assert(false, "Invalid URL")
      return
    }
    var urlRequst = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: timeoutInterval)
    urlRequst.httpMethod = "GET"
    urlRequst.allHTTPHeaderFields = headers
    NSLog("Sending request: \(url)")
    let operation = BlockOperation.init {
      let dataTask = URLSession.shared.dataTask(with: urlRequst) { data, response, error in
        if let error = error {
          NSLog("Response of \(url) meet an error: \(error.localizedDescription)")
        }
        completionHandler(response as? HTTPURLResponse, data, error)
      }
      dataTask.resume()
    }
    operationQueue.addOperation(operation)
  }

  public func httpPost() {
    // TODO: http post
  }

  private init() {}
}
