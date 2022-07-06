//
//  GameViewController.swift
//  Alias
//
//  Created by Таня on 17.05.2022.
//

import UIKit

class GameViewController: UIViewController {
    
    var wordText: String?
    var category: Category = Animals()
    var timer = Timer()
    var seconds = 20
    var secondsPassed = 0
    var procentageProgress: Float = 0.0
    
    @IBOutlet weak var wordLabel: UILabel! 
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var progress: UIProgressView!
    @IBOutlet weak var numOfprogress: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        score.text = String(category.scoreNumber)
        wordLabel.text = wordText
        time()
    }
    
    @IBAction func rightAnswer(_ sender: UIButton) {
        upDate()
        score.text = String(category.scoreCount(answer: true))
    }
    
    @IBAction func skipButton(_ sender: UIButton) {
        upDate()
        score.text = String(category.scoreCount(answer: false))
    }
    
    
    @IBAction func throwOffButton(_ sender: UIButton) {
    }
    
    func upDate() {
        wordLabel.text = category.getName()
        category.numbOfName += 1
    }
    
    
    @IBAction func getResult(_ sender: UIButton) {
        performSegue(withIdentifier: "segueForScoreAndJoke", sender: self)
    }
    
    func time(){
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(upDateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func upDateTimer(){
        secondsPassed += 1
        if  secondsPassed < seconds  {
            procentageProgress = Float(secondsPassed) / Float(seconds)
            progress.progress = procentageProgress
            let procentageProgressStr = String(format: "%.1f", procentageProgress)
            numOfprogress.text = procentageProgressStr
        }
        else {
            progress.progress = 0.0
            numOfprogress.text = "0"
            category.numbOfName = category.name.count - 1
            wordLabel.text = "Конец"
            timer.invalidate()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueForScoreAndJoke" {
            let destinationVC = segue.destination as! ScoreViewController
            destinationVC.scoreInt = category.scoreNumber
    }
}


}
    
    

