//
//  PunViewController.swift
//  ikid
//
//  Created by Lauren Antilla on 10/31/17.
//  Copyright © 2017 Lauren Antilla. All rights reserved.
//

import UIKit

class PunViewController: UIViewController {
    @IBOutlet weak var punLabel: UILabel!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    var jokes: [[String: String]] = []
    var d1 = ["joke0": "What does Peter Parker tell people when they ask what he does for a living?", "answer": "He says he's a web designer."]
    var d2 = ["joke0": "image", "answer": "pun_joke1"]
    var d0 = ["joke0": "Why does the ghost always need more books?", "answer": "He goes through them too quickly."]
    var count = 0
    var jokeCount = 0
    var onAns = true
    var restart = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.isHidden = true
        jokes = [d0, d1, d2]
        nextBtn.setTitle("Next",for: .normal)
        punLabel.text = jokes[count]["joke0"]
        nextBtn.layer.cornerRadius = 5
        nextBtn.contentEdgeInsets = UIEdgeInsets(top: 5,left: 5,bottom: 5,right: 5)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextBtnPushed(_ sender: Any) {
        if restart {
            restart = false
            nextBtn.setTitle("Next",for: .normal)
        }
        if count == jokes.count {
            imageView.isHidden = true
            punLabel.isHidden = false
            punLabel.text = "That's all!"
            count = 0
            onAns = false
            nextBtn.setTitle("Start Over",for: .normal)
            restart = true
        } else if jokes[count]["joke\(jokeCount)"] == "image" {
            imageView.isHidden = false
            punLabel.isHidden = true
            imageView.image = UIImage(named: jokes[count]["answer"]!)
            imageView.contentMode = .scaleAspectFit
            count += 1
            onAns = false
        } else {
            imageView.isHidden = true
            punLabel.isHidden = false
            if onAns == true {
                punLabel.text = jokes[count]["answer"]
                count += 1
                onAns = false
            } else {
                punLabel.text = jokes[count]["joke\(jokeCount)"]
                jokeCount += 1
                if jokeCount > jokes[count].count - 2 {
                    onAns = !onAns
                    jokeCount = 0
                }
            }
        }
    }
    

}

