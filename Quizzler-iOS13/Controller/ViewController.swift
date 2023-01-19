//
//  ViewController.swift
//  [Quizzler]-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreCounter: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    var quizBrain = QuizBrain()
    var answers: [String] = []
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        if(quizBrain.checkAnswer(sender.currentTitle!)){
            sender.backgroundColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red
        }
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self,   selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    @objc func updateUI(){
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        thirdButton.backgroundColor = UIColor.clear
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        scoreCounter.text = "Score \(quizBrain.getScore())"
        answers = quizBrain.getAnswers()
        trueButton.setTitle(answers[0], for: .normal)
        falseButton.setTitle(answers[1], for: .normal)
        thirdButton.setTitle(answers[2], for: .normal)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
    }
}
