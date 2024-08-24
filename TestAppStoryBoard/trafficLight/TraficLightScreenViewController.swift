//
//  TraficLightScreenViewController.swift
//  TestAppStoryBoard
//
//  Created by Beknur Patsaev on 27.07.2024.
//


import UIKit

final class TraficLightScreenViewController: UIViewController {
  
  @IBOutlet weak var redLightView: UIView!
  @IBOutlet weak var yellowLightView: UIView!
  @IBOutlet weak var greenLightView: UIView!
  
  @IBOutlet weak var startButton: UIButton!
  
  private var currentLight = Lights.red
  private let lightIsOn = 1.0
  private let lightIsOff = 0.3

  override func viewDidLoad() {
    super.viewDidLoad()
    
    redLightView.alpha = lightIsOff
    yellowLightView.alpha = lightIsOff
    greenLightView.alpha = lightIsOff
    
    startButton.setTitle("Start", for: .normal)
  }
  
  override func viewWillLayoutSubviews() {
    redLightView.layer.cornerRadius = redLightView.frame.width / 2.0
    yellowLightView.layer.cornerRadius = yellowLightView.frame.width / 2.0
    greenLightView.layer.cornerRadius = greenLightView.frame.width / 2.0
  }
  
  @IBAction func startButtonPressed() {
    if (startButton.currentTitle == "Start") {
      startButton.setTitle("Next", for: .normal)
    }
    
    changeLight()
  }
  
  private func changeLight() {
    switch currentLight {
    case .red:
      redLightView.alpha = lightIsOn
      greenLightView.alpha = lightIsOff
      currentLight = .yellow
    case .yellow:
      redLightView.alpha = lightIsOff
      yellowLightView.alpha = lightIsOn
      currentLight = .green
    case .green:
      yellowLightView.alpha = lightIsOff
      greenLightView.alpha = lightIsOn
      currentLight = .red
    }
  }
}

// MARK: CurrentLight
extension TraficLightScreenViewController {
  private enum Lights {
    case red, yellow, green
  }
}
