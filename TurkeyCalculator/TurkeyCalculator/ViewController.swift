//
//  ViewController.swift
//  TurkeyCalculator
//
//  Created by Paul Solt on 6/3/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Outlets
    
    @IBOutlet var turkeyWeightTextField: UITextField!
    @IBOutlet var cookTimeTextField: UITextField!
    @IBOutlet var metricButton: UIButton!
    
    // Actions
    
    @IBAction func calculateButtonPressed(_ sender: Any) {
        guard let turkeyWeightString =
            turkeyWeightTextField.text else { return }
        
        guard let turkeyWeight = Double(turkeyWeightString) else {
            print("Ivalid number")
            return
        }
        
        var durationInMinutes: Double
        
        if metricButton.isSelected {
            durationInMinutes = cookTimeInKilograms(turkeyWeight)
        } else {
            durationInMinutes = cookTimeInPounds(turkeyWeight)
        }

        cookTimeTextField.text = "\(durationInMinutes)"
    }
    
    @IBAction func metricButtonPressed(_ sender: Any) {
        guard let button = sender as? UIButton else { return }
        
        button.isSelected.toggle()
    }
    
    // Helper functions
    func cookTimeInPounds(_ weight: Double) -> Double{
        let durationInMinutes = weight * 15
        return durationInMinutes
    }
    
    func cookTimeInKilograms(_ weight: Double) -> Double {
        var durationInMinutes: Double
        
        if weight >= 4 {
            durationInMinutes = 20 * weight + 90
        } else {
            durationInMinutes = 20 + weight + 70
        }
        return durationInMinutes
    }
}
