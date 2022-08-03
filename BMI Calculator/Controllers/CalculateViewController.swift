//
//  CalculateViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    var height  : Float = 0.0
    var weight  : Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func heightValueChanged(_ sender: UISlider) {
        height = sender.value
        let heightText = String(format: "%.2f", height)
        heightLabel.text = heightText + "m"
    }
    
    @IBAction func weightValueChanged(_ sender: UISlider) {
        weight = sender.value
        let weightText = String(weight)
        weightLabel.text =  weightText + "Kg"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {

        calculatorBrain.calculateBMI(height: height, weight: weight)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "goToResult") {
            if let destinationVC = segue.destination as? ResultViewController {
                destinationVC.bmiValue  = calculatorBrain.getBMIValue()
                destinationVC.advice    = calculatorBrain.getAdvice()
                destinationVC.color     = calculatorBrain.getColor()
            }
        }
    }
    
    private var calculatorBrain = CalculatorBrain()
}

