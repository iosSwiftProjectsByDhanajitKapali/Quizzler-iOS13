//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueBtn: UIButton!
    @IBOutlet weak var falseBtn: UIButton!
    
    var quizBrain = QuizBrain()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }


    @IBAction func answerBtn(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!    //True , False
        
        //cheking the answer
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        if userGotItRight{
            sender.backgroundColor = UIColor.green      //change Btn color to green incase of right ans
        }else{
            sender.backgroundColor = UIColor.red        //change Btn color to red incase of wrong ans
        }
        
        //going to next question
        quizBrain.nextQuestion()
        
        //timer used so that background color of Btns changed stays for a bit
        Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(updateUI), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()  //increasing the progrss bar
        
        //reset the background color of the buttons for the next question
        trueBtn.backgroundColor = UIColor.clear
        falseBtn.backgroundColor = UIColor.clear
    }
}

