//
//  GreetingViewController.swift
//  TestAppStoryBoard
//
//  Created by Beknur Patsaev on 23.08.2024.
//

import UIKit

class GreetingViewController: UIViewController {
  
  var userName: String? = nil
  @IBOutlet weak var greeting: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    greeting.text = "Welcome, \(userName ?? "")!"
  }
  
  @IBAction func tapOnLogOut(_ sender: Any) {
    self.dismiss(animated: true)
  }
}
