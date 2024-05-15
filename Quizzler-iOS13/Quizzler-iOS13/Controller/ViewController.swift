//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var choose1Button: UIButton!
    @IBOutlet var choose2Button: UIButton!
    @IBOutlet var choose3Button: UIButton!
    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet var questionLabel: UILabel!
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        if userGotItRight{
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
     
        
    }
    @objc func updateUI(){
        questionLabel.text = quizBrain.getQuestionText()
        choose1Button.setTitle(quizBrain.getChoose1ButtonText(), for: .normal)
        choose2Button.setTitle(quizBrain.getChoose2ButtonText(), for: .normal)
        choose3Button.setTitle(quizBrain.getChoose3ButtonText(), for: .normal)
        choose1Button.backgroundColor = UIColor.clear
        choose2Button.backgroundColor = UIColor.clear
        choose3Button.backgroundColor = UIColor.clear
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore()) "
        
    }
}

