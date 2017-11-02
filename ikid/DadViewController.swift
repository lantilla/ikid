//
//  DadViewController.swift
//  ikid
//
//  Created by Lauren Antilla on 10/31/17.
//  Copyright © 2017 Lauren Antilla. All rights reserved.
//

import UIKit

class DadViewController: UIViewController {
    @IBOutlet weak var dadLabel: UILabel!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    var jokes: [[String: String]] = []
    var d0 = ["joke0": "Hostess: Do you have reservations?", "answer": " Dad: No. I'm confident I want to eat here."]
    var d1 = ["joke0": "image", "answer": "dad_joke1"]
    var count = 0
    var jokeCount = 0
    var onAns = true
    var restart = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        count = 0
        imageView.isHidden = true
        nextBtn.setTitle("Next",for: .normal)
        jokes = [d0, d1]
        dadLabel.text = jokes[count]["joke0"]
        nextBtn.layer.cornerRadius = 5
        nextBtn.contentEdgeInsets = UIEdgeInsets(top: 5,left: 5,bottom: 5,right: 5)
        // Do any additional setup after loading the view.
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
            dadLabel.isHidden = false
            dadLabel.text = "That's all!"
            count = 0
            onAns = false
            nextBtn.setTitle("Start Over",for: .normal)
            restart = true
        } else if jokes[count]["joke\(jokeCount)"] == "image" {
            imageView.isHidden = false
            dadLabel.isHidden = true
            imageView.image = UIImage(named: jokes[count]["answer"]!)
            imageView.contentMode = .scaleAspectFit
            count += 1
            onAns = false
        } else {
            imageView.isHidden = true
            dadLabel.isHidden = false
            if onAns == true {
                dadLabel.text = jokes[count]["answer"]
                count += 1
                onAns = false
            } else {
                dadLabel.text = jokes[count]["joke\(jokeCount)"]
                jokeCount += 1
                if jokeCount > jokes[count].count - 2 {
                    onAns = !onAns
                    jokeCount = 0
                }
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
