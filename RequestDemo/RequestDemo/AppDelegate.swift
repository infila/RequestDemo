//
//  AppDelegate.swift
//  RequestDemo
//
//  Created by James Chen on 2021/3/25.
//

import Foundation
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    GithubDataManager.shared.start()
    return true
  }
}
