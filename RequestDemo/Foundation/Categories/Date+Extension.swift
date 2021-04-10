//
//  Date+Extension.swift
//  RequestDemo
//
//  Created by James Chen on 2021/4/10.
//

import Foundation

extension Date {
  public init(withTimeMills timeMills: Int64) {
    self.init(timeIntervalSince1970: Double(timeMills / 1000))
  }

  public var timeMills: Int64 {
    return Int64(timeIntervalSince1970 * 1000)
  }

  public func toString(withFormat format: String = "yy/MM/dd") -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = format
    return dateFormatter.string(from: self)
  }
}
