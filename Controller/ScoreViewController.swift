//
//  ScoreViewController.swift
//  Alias
//
//  Created by Таня on 17.05.2022.
//

import UIKit

class ScoreViewController: UIViewController {
    
    var scoreInt: Int = 0
    var jokeText = ""
    var responseOnJokeText = ""
    var jokeManager: JokeManager = JokeManager()
    
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var joke: UILabel!
    @IBOutlet weak var responseOnJoke: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        score.text = String(scoreInt)
        joke.text = jokeText
        responseOnJoke.text = responseOnJokeText
        jokeManager.delegate = self
        jokeManager.getUrl()
    }
}

//MARK: - JokeManagerDelegate

extension ScoreViewController: JokeManagerDelegate {
    func updateJoke(jokeModel: JokeModel) {
           DispatchQueue.main.async {
               self.jokeText = jokeModel.joke
               self.responseOnJokeText = jokeModel.response
               self.joke.text = jokeModel.joke
               self.responseOnJoke.text = jokeModel.response
        }
    }
}

