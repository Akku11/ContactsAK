//
//  ViewController.swift
//  MyContacts
//
//  Created by Akanksha Thakur on 31/7/22.
//

import UIKit

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    let navVC = UINavigationController(rootViewController: ListTableViewController())
    navVC.modalPresentationStyle = .fullScreen
    self.present(navVC, animated: true, completion: nil)
  }
}

