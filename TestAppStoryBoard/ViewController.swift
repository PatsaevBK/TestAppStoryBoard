//
//  ViewController.swift
//  TestAppStoryBoard
//
//  Created by Beknur Patsaev on 24.07.2024.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var greeting: UILabel!
  @IBOutlet weak var hideButton: UIButton!
  @IBOutlet weak var greetingButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    greetingButton.layer.cornerRadius = 10
  }

  @IBAction func hideGreeting(_ sender: UIButton) {
    greeting.isHidden.toggle()
    
    hideButton.setTitle(greeting.isHidden ? "Show Greeting" : "Hide Greeting", for: .normal)
  }
}

