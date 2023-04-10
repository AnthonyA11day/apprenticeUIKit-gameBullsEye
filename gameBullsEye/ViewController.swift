//
//  ViewController.swift
//  gameBullsEye
//
//  Created by Anthony on 04.04.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue: Int = 50
    var targetValue: Int = 0
    var score = 0
    var round = 1
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var targetLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var roundLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
        startNewRound()
        
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")!
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")!
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)

        let insets = UIEdgeInsets(
          top: 0,
          left: 14,
          bottom: 0,
          right: 14)
        
        let trackLeftImage = UIImage(named: "SliderTrackLeft")!
        let trackLeftResizable = trackLeftImage.resizableImage(
          withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        let trackRightImage = UIImage(named: "SliderTrackRight")!
        let trackRightResizable = trackRightImage.resizableImage(
          withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
    }
    
    @IBAction func showAlert() {
        
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        
        var title = ""
        if difference < 1 {
            title = "Perfect!"
            points += 100
        } else if difference < 5 {
            title = "You almost had it!"
            if difference < 2 {
                points += 50
            }
        } else if difference < 10 {
            title = "Pretty good!"
        } else {
            title = "Not even close..."
        }
        
        let message = "Your score is: \(points)"
        
        score += points
        round += 1
        
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        let action = UIAlertAction(
            title: "Ok",
            style: .default)
        { _ in self.startNewRound() }
//            handler: { _ in
//                self.startNewRound()
//              })
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
//        startNewRound()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lround(Double(slider.value))
        print("slider \(currentValue)")
    }
    
    @IBAction func startOver() {
        slider?.value = 50
//        currentValue = 50
        score = 0
        round = 0
        updateLabels()
    }
    
    func startNewRound() {
        
        //anomation
        let transition = CATransition()
          transition.type = CATransitionType.fade
          transition.duration = 1
          transition.timingFunction = CAMediaTimingFunction(
            name: CAMediaTimingFunctionName.easeOut)
          view.layer.add(transition, forKey: nil)
        
        //new round
        targetValue = Int.random(in: 1...100)
//        currentValue = 50
//        currentValue = lround(Double(slider.value))
        slider.value = Float(currentValue)
        updateLabels()
        
        
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
}
