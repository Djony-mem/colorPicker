//
//  ColorPickerViewController.swift
//  UIKitUpdates
//
//  Created by Teply, Daniel
//

import UIKit

//MARK: - ColorPickerViewController
final class ColorPickerViewController: UIViewController {

    @IBOutlet weak var colorSampleView: UIView! {
        didSet {
            colorSampleView.backgroundColor = defaultColor
            colorSampleView.layer.cornerRadius = 8.0
        }
    }

    @IBOutlet weak var pickColorButton: UIButton! {
        didSet {
            pickColorButton.tintColor = defaultColor
        }
    }
    
    private let defaultColor = UIColor.red
    
    @IBAction func pickColorTapped() {
        let pickerVC = UIColorPickerViewController()
        pickerVC.delegate = self
        pickerVC.selectedColor = colorSampleView.backgroundColor ?? .black
        pickerVC.supportsAlpha = false
        present(pickerVC, animated: true)
    }
}

//MARK: - UIColorPickerViewControllerDelegate
extension ColorPickerViewController: UIColorPickerViewControllerDelegate {
    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        colorSampleView.backgroundColor = viewController.selectedColor
        pickColorButton.tintColor = viewController.selectedColor
    }
}
