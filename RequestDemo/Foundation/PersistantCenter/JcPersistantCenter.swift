//
//  JcPersistantCenter.swift
//  RequestDemo
//
//  Created by James Chen on 2021/3/31.
//

import UIKit

class JcPersistantCenter: JcSingleton {
  
  private let fileManager = FileManager()
  private let rootPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0].appending("/root")
  
  public func fileExists(_ fileName: String) -> Bool {
    assert(!fileName.isEmpty)
    return fileManager.fileExists(atPath: filePath(forFile: fileName))
  }

  public func save(data: Data, toFile fileName: String, compressing: Bool = false, encrypting: Bool = false) {
    assert(data.count > 0)
    assert(!fileName.isEmpty)
    var tempData = data
    if compressing {
      tempData = compressingData(tempData)
    }
    if encrypting {
      tempData = encryptingData(tempData)
    }
    let path = filePath(forFile: fileName)
    let directory = fileDirectory(forFile: fileName)
    if !fileExists(filePath(forFile: fileName)) {
      do {
        try fileManager.createDirectory(atPath: directory, withIntermediateDirectories: true, attributes: nil)
      } catch let error as NSError {
        assert(false, error.domain)
      }
    }
    do {
      try data.write(to: URL.init(fileURLWithPath: path), options: .atomic)
    } catch let error as NSError {
      assert(false, error.domain)
    }
  }
  
  public func loadData(fromFile fileName: String, compressing: Bool = false, encrypting: Bool = false) -> Data {
    assert(!fileName.isEmpty)
    assert(fileExists(fileName))
    let path = filePath(forFile: fileName)
    var data = Data()
    do {
      try data = Data(contentsOf: URL.init(fileURLWithPath: path))
      if encrypting {
        data = unencryptingData(data)
      }
      if compressing {
        data = uncompressingData(data)
      }
    } catch let error as NSError {
      assert(false, error.domain)
    }
    return data
  }
  
  public func removeFile(_ fileName: String) {
    guard fileExists(fileName) else {
      return
    }
    try? fileManager.removeItem(atPath: filePath(forFile: fileName)) 
  }
  
  private func filePath(forFile fileName: String) -> String {
    return rootPath + "/" + fileName
  }
  
  private func fileDirectory(forFile fileName: String) -> String {
    let path = filePath(forFile: fileName)
    var directory = path
    let range = (path.lastIndex(of: "/") ?? path.startIndex) ..< path.endIndex
    directory.removeSubrange(range)
    return directory
  }
  
  private func compressingData(_ data: Data) -> Data {
    // TODO: compressing
    return Data()
  }
  
  private func uncompressingData(_ data: Data) -> Data {
    // TODO: uncompressing
    return Data()
  }
  
  private func encryptingData(_ data: Data) -> Data {
    // TODO: encrypting
    return Data()
  }
  
  private func unencryptingData(_ data: Data) -> Data {
    // TODO: unencrypting
    return Data()
  }
}
