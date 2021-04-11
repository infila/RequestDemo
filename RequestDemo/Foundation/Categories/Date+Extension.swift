//
//  Date+Extension.swift
//  RequestDemo
//
//  Created by James Chen on 2021/4/10.
//

import Foundation

extension Date {
  public static var DATE_FORMAT_TIME: String { return "hh:mm:ss" }
  public static var DATE_FORMAT_DAY: String { return "MM/dd/yy" }
  public static var DATE_FORMAT_FULL: String { return "MM/dd/yy hh:mm:ss" }

  public init(timeMills: Int64) {
    self.init(timeIntervalSince1970: Double(timeMills / 1000))
  }

  public var timeMills: Int64 {
    return Int64(timeIntervalSince1970 * 1000)
  }

  public func toString(withFormat format: String = DATE_FORMAT_DAY) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = format
    return dateFormatter.string(from: self)
  }
}
