//
//  ViewController.swift
//  HitMeGame
//
//  Created by Waleed Saad on 12/5/18.
//  Copyright © 2018 Waleed Saad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    //VARIABLES
    private var target = 0
    private var round = 0
    private var hitnumber: Int!
    private var score: Int!

    override func viewDidLoad() {
        super.viewDidLoad()

        score = 0
        hitnumber = lroundf(slider.value)
        resetViews()
    }

    @IBAction func sliderAction(_ sender: UISlider) {
        hitnumber = lroundf(sender.value)
    }
    
    @IBAction func hitMeAction(_ sender: UIButton) {
        let differnece = abs(target - hitnumber)
        let newScore: Int
        differnece == 0 ? (newScore = 200) : (newScore = 100 - differnece)
        let message = "You selected \(hitnumber!)" +
        "\nSo you scored \(newScore) points"
        let title: String
        if differnece == 0 {
            title = "PERFECT!"
        } else if differnece <= 5 {
            title = "Almost!"
        } else {
            title = "Away"
        }
        let hitAlert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let playAgainAction = UIAlertAction(title: "Play Again", style: .default) { (UIAlertAction) in
            hitAlert.dismiss(animated: true, completion: nil)
            self.resetViews()
        }
        hitAlert.addAction(playAgainAction)
        present(hitAlert, animated: true, completion: nil)
        score += newScore
        }
    
    private func generateRandomTarget(){
        target = 1 + Int(arc4random_uniform(99))
    }
    
    private func resetViews(){
        generateRandomTarget()
        slider.value = 50
        targetLabel.text = String(target)
        round += 1
        roundLabel.text = String(round)
        scoreLabel.text = String(score)
    }
}

