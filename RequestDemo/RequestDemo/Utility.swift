//
//  Utility.swift
//  RequestDemo
//
//  Created by James Chen on 2021/4/10.
//

import Foundation

class Utility {
  class func dateDisplayFormatNormal(_ date: Date) -> String {
    return date.toString(withFormat: Date.DATE_FORMAT_TIME)
  }

  class func dateDisplayFormatDetail(_ date: Date) -> String {
    return date.toString(withFormat: Date.DATE_FORMAT_FULL)
  }
}
