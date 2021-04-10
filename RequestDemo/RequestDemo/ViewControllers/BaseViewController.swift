//
//  BaseViewController.swift
//  RequestDemo
//
//  Created by James Chen on 2021/3/31.
//

import UIKit

class BaseViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    NSLog("%@ -- viewDidLoad", NSStringFromClass(Self.self));
    // Do any additional setup after loading the view.
  }
    
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    NSLog("%@ -- viewWillAppear", NSStringFromClass(Self.self));
  }

  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    NSLog("%@ -- viewDidDisappear", NSStringFromClass(Self.self));
  }
}
