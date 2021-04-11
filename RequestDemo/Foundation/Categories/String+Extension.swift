//
//  String+Extension.swift
//  RequestDemo
//
//  Created by James Chen on 2021/3/31.
//

import Foundation

extension String {
  public func url(appendParameters parameters: [String: String] = [:]) -> String {
    assert(hasPrefix("https://") || hasPrefix("http://"))
    if parameters.isEmpty {
      return self
    }
    var urlString = self
    if urlString.last != "?" {
      urlString += "?"
    }
    var needAnd = false
    for (key, value) in parameters {
      if needAnd {
        urlString += "&"
      }
      urlString = urlString + key + "=" + value
      needAnd = true
    }
    return urlString
  }
}
