//
//  GoodViewController.swift
//  ikid
//
//  Created by Lauren Antilla on 10/31/17.
//  Copyright © 2017 Lauren Antilla. All rights reserved.
//

import UIKit

class GoodViewController: UIViewController {
    @IBOutlet weak var goodLabel: UILabel!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    var jokes: [[String:String]] = []
    var d0 = ["joke0": "Why is Darth Vader not safe for children under age 3?", "answer": "He’s a choking hazard!"]
    var d1 = ["joke0": "image", "answer": "good_joke1"]
    var d2 = ["joke0": "Knock knock.", "joke1": "Who's there?", "joke2": "Robin.", "joke3": "Robin who?", "answer": "Robin you, now hand over the cash."]
    var count = 0
    var jokeCount = 0
    var onAns = true
    var restart = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.isHidden = true
        jokes = [d0, d1, d2]
        nextBtn.setTitle("Next",for: .normal)
        goodLabel.text = jokes[count]["joke0"]
        nextBtn.layer.cornerRadius = 5
        nextBtn.contentEdgeInsets = UIEdgeInsets(top: 5,left: 5,bottom: 5,right: 5)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func nextBtnPressed(_ sender: Any) {
        if restart {
            restart = false
            nextBtn.setTitle("Next",for: .normal)
        }
        if count == jokes.count {
            imageView.isHidden = true
            goodLabel.isHidden = false
            goodLabel.text = "That's all!"
            count = 0
            onAns = false
            nextBtn.setTitle("Start Over",for: .normal)
            restart = true
        } else if jokes[count]["joke\(jokeCount)"] == "image" {
            imageView.isHidden = false
            goodLabel.isHidden = true
            imageView.image = UIImage(named: jokes[count]["answer"]!)
            imageView.contentMode = .scaleAspectFit
            count += 1
            onAns = false
        } else {
            imageView.isHidden = true
            goodLabel.isHidden = false
            if onAns == true {
                goodLabel.text = jokes[count]["answer"]
                count += 1
                onAns = false
            } else {
                goodLabel.text = jokes[count]["joke\(jokeCount)"]
                jokeCount += 1
                if jokeCount > jokes[count].count - 2 {
                    onAns = !onAns
                    jokeCount = 0
                }
            }
        }
    }
    
}

