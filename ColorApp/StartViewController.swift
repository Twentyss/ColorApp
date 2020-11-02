//
//  ViewController.swift
//  ColorApp
//
//  Created by Илья Першин on 01.11.2020.
//

import UIKit

protocol StartViewControllerDelegate {
    func setViewColor(_ color: UIColor)
}

class StartViewController: UIViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let colorSettingsVC = segue.destination as! ColorSettingsViewController
        colorSettingsVC.startViewColor = view.backgroundColor
        colorSettingsVC.delegate = self
    }
}

extension StartViewController: StartViewControllerDelegate {
    func setViewColor(_ color: UIColor) {
        view.backgroundColor = color
    }
}

