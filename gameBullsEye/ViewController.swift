//
//  ViewController.swift
//  gameBullsEye
//
//  Created by Anthony on 04.04.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue: Int = 0
    var targetValue: Int = 0
    var score = 0
    
//    var sliderValue: Int = 0
    
    @IBOutlet var slider: UISlider?
    @IBOutlet var targetLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
        startNewRound()
//        currentValue = lround(Double(slider.value))
    }
    
    @IBAction func showAlert() {
        
        let difference = abs(targetValue - currentValue)
        let points = 100 - difference
        
//        let message = "The value of the slider is: \(currentValue)" +
//            "\n The target value is: \(targetValue)" +
//            "\n The difference is: \(difference)"
        
        let message = "Your score is: \(points)"
        
        score += points
        
        let alert = UIAlertController(
            title: "Hello, world!",
            message: message,
            preferredStyle: .alert)
        let action = UIAlertAction(
            title: "Ok",
            style: .default,
            handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        startNewRound()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lround(Double(slider.value))
        print("slider \(currentValue)")
    }
    
    func startNewRound() {
        targetValue = Int.random(in: 1...100)
//        currentValue = 50
//        currentValue = lround(Double(slider.value))
        slider?.value = Float(currentValue)
        updateLabels()
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
    }
}
