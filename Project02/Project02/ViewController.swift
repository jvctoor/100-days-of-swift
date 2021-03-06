//
//  ViewController.swift
//  Project02
//
//  Created by João Victor on 23/03/22.
//

import UIKit

class ViewController: UIViewController {
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        askQuestion(nil)
        
    }

    func askQuestion(_ action: UIAlertAction!) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = countries[correctAnswer].uppercased()
    }
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        
        if sender.tag == correctAnswer {
            title = "Correto"
            score+=1
        } else {
            title = "Errado"
            score-=1
        }
        
        let ac = UIAlertController(title: title, message: "Você tem \(score) pontos", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continuar", style: .default, handler: askQuestion))
        present(ac, animated: true)
        
    }
    
}

