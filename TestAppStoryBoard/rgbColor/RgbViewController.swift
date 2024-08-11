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
    
    setUp()
  }
  
  @IBAction func redSliderAction() {
    sliderChanged(with: .Red)
  }
  
  @IBAction func greenSliderAction() {
    sliderChanged(with: .Green)
  }
  
  @IBAction func blueSliderAction() {
    sliderChanged(with: .Blue)
  }
  
  private func setUp() {
    colorImage.layer.cornerRadius = colorImage.frame.width / 10.0
    
    redValue.text = redSlider.value.formatted()
    greenValue.text = greenSlider.value.formatted()
    blueValue.text = blueSlider.value.formatted()
    
    changeColor()
  }
  
  private func sliderChanged(with color: Colors) {
    switch color {
    case .Red:
      redValue.text = String(format: "%.2f", redSlider.value)
      changeColor()
    case .Green:
      greenValue.text = String(format: "%.2f", greenSlider.value)
      changeColor()
    case .Blue:
      blueValue.text = String(format: "%.2f", blueSlider.value)
      changeColor()
    }
  }
  
  private func changeColor() {
    colorImage.backgroundColor = UIColor(
      red: CGFloat(redSlider.value),
      green: CGFloat(greenSlider.value),
      blue: CGFloat(blueSlider.value),
      alpha: alpha
    )
  }
}

private extension RgbViewController {
  enum Colors {
    case Red, Green, Blue
  }
}
