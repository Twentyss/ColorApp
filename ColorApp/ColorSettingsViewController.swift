//
//  ColorSettingsViewController.swift
//  ColorApp
//
//  Created by Илья Першин on 01.11.2020.
//

import UIKit

class ColorSettingsViewController: UIViewController {

    var delegate: StartViewControllerDelegate!
    var startViewColor: UIColor!
    
    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        colorView.layer.cornerRadius = 15
        
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
                
        setValue(for: redLabel, greenLabel, blueLabel)
        
        setSlidersValue(sliders: redSlider, greenSlider, blueSlider)
    }
    
    
    @IBAction func rgbSlider(_ sender: UISlider) {
        setColor()
        
        switch sender.tag {
        case 0: redLabel.text = string(from: sender)
        case 1: greenLabel.text = string(from: sender)
        case 2: blueLabel.text = string(from: sender)
        default: break
        }
    }
    
    @IBAction func doneButtonPressed() {
        guard let viewColor = colorView.backgroundColor else { return }
        delegate.setViewColor(viewColor)
        dismiss(animated: true)
    }
    
    
    private func setSlidersValue(sliders: UISlider...) {
        sliders.forEach { slider in
            switch slider.tag {
            case 0:
                redSlider.value = Float(startViewColor.rgba.red)
                rgbSlider(redSlider)
            case 1:
                greenSlider.value = Float(startViewColor.rgba.green)
                rgbSlider(greenSlider)
            case 2:
                blueSlider.value = Float(startViewColor.rgba.blue)
                rgbSlider(blueSlider)
            default: break
            }
        }
    }
    
    private func setColor() {
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                            green: CGFloat(greenSlider.value),
                                            blue: CGFloat(blueSlider.value),
                                            alpha: 1)
    }
        
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label.tag {
            case 0: redLabel.text = string(from: redSlider)
            case 1: greenLabel.text = string(from: greenSlider)
            case 2: blueLabel.text = string(from: blueSlider)
            default: break
            }
        }
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
}

extension UIColor {
    var rgba: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        return (red, green, blue, alpha)
    }
}
