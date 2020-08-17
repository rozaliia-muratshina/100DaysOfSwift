//
//  ViewController.swift
//  Project2
//
//  Created by Розалия on 01.07.2020.
//  Copyright © 2020 Розалия. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var questionCounter = 0



    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        countries.append("estonia")
        countries.append("france")
        countries.append("germany")
        countries.append("ireland")
        countries.append("italy")
        countries.append("monaco")
        countries.append("nigeria")
        countries.append("russia")
        countries.append("spain")
        countries.append("uk")
        countries.append("us")
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
        
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
    }

    func askQuestion(action: UIAlertAction! = nil) {
        
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
                
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        let title1 = countries[correctAnswer].uppercased()
        title = "\(title1)    Score: \(score)"
    }

    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        questionCounter+=1
        print(questionCounter)
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score+=1
        }else {
            title = "Wrong. It is \(countries[sender.tag].uppercased())"
            score-=1
        }
        
        
        var ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        
        if questionCounter >= 5 {
            ac = UIAlertController(title: "Mission complete", message: "Your score is \(score)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Start new game", style: .default, handler: askQuestion))
            score = 0
            questionCounter = 0
        }else {
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        }
        
        
        present(ac, animated: true)
        
    }
    

    
    @objc func shareTapped() {
        let message = "My score is \(score)"
        print(score)
        let vc = UIActivityViewController(activityItems: [message], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
}

