//
//  RgbViewController.swift
//  TestAppStoryBoard
//
//  Created by Beknur Patsaev on 11.08.2024.
//

import UIKit

final class RgbViewController: UIViewController {
  
  @IBOutlet var colorImage: UIView!
  
  @IBOutlet var redValue: UILabel!
  @IBOutlet var greenValue: UILabel!
  @IBOutlet var blueValue: UILabel!
  
  @IBOutlet var redSlider: UISlider!
  @IBOutlet var greenSlider: UISlider!
  @IBOutlet var blueSlider: UISlider!
  
  private let alpha = 1.0

  override func viewDidLoad() {
    super.viewDidLoad()
    
    colorImage.layer.cornerRadius = colorImage.frame.width / 10.0
    
    redValue.text = string(from: redSlider)
    greenValue.text = string(from: greenSlider)
    blueValue.text = string(from: blueSlider)
    
    setColor()
  }
  
  @IBAction func sliderAction(_ sender: UISlider) {
    setColor()
    
    switch sender {
    case redSlider:
      redValue.text = string(from: redSlider)
    case greenSlider:
      greenValue.text = string(from: greenSlider)
    default:
      blueValue.text = string(from: blueSlider)
    }
  }
  
  private func setColor() {
    colorImage.backgroundColor = UIColor(
      red: redSlider.value.cgFloat(),
      green: greenSlider.value.cgFloat(),
      blue: blueSlider.value.cgFloat(),
      alpha: alpha
    )
  }
  
  private func string(from slider: UISlider) -> String {
    String(format: "%.2f", slider.value)
  }
}

private extension Float {
  func cgFloat() -> CGFloat {
    CGFloat(self)
  }
}
