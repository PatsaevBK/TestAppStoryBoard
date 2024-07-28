//
//  TraficLightScreenViewController.swift
//  TestAppStoryBoard
//
//  Created by Beknur Patsaev on 27.07.2024.
//


import UIKit

class TraficLightScreenViewController: UIViewController {
  
  @IBOutlet weak var redLight: UIView!
  @IBOutlet weak var yellowLight: UIView!
  @IBOutlet weak var greenLight: UIView!
  private var colors: [UIView] = []
  private var currentLightIndex: Int  = 0

  override func viewDidLoad() {
    super.viewDidLoad()
    
    colors.append(redLight)
    colors.append(yellowLight)
    colors.append(greenLight)
    
    changeLight()
  }
  
  @IBAction func changeCurrentLight(_ sender: Any) {
    currentLightIndex = (currentLightIndex + 1) % colors.count
    changeLight()
  }
  
  private func changeLight() {
    for (index, color) in colors.enumerated() {
      color.layer.cornerRadius = color.bounds.height / 2
      if (index != currentLightIndex) {
        color.alpha = 0.5
      } else {
        color.alpha = 1
      }
    }
  }
}
