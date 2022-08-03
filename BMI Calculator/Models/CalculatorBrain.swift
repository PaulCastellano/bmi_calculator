//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Eugeniu Garaz on 8/3/22.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

struct CalculatorBrain {
    var bmi: BMI?
    
    mutating func calculateBMI(height: Float, weight: Float) {
        if (height == 0) {return}
        let bmiValue = weight / (height * height)
        
        if (bmiValue < 18.5) {
            bmi = BMI(value: bmiValue, advice: "Eat more pies!", color: .blue)
        } else if (bmiValue < 24.9) {
            bmi = BMI(value: bmiValue, advice: "Fit as a fiddle!", color: .green)
        } else {
            bmi = BMI(value: bmiValue, advice: "Eat less pies!", color: .systemPink)
        }
    }
    
    func getBMIValue() -> String {
        return String(format: "%.1f", bmi?.value ?? 0.0)
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? ""
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? .white
    }
}
