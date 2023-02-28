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
    
    @IBAction func pickColorTapped(_ sender: UIButton) {
        let picker = UIColorPickerViewController()
        picker.delegate = self
        picker.selectedColor = colorSampleView.backgroundColor ?? .black
        picker.supportsAlpha = false
        present(picker, animated: true, completion: nil)
    }
}

//MARK: - UIColorPickerViewControllerDelegate
extension ColorPickerViewController: UIColorPickerViewControllerDelegate {
    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        colorSampleView.backgroundColor = viewController.selectedColor
        pickColorButton.tintColor = viewController.selectedColor
    }
}
