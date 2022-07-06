//
//  ViewController.swift
//  Alias
//
//  Created by Таня on 17.05.2022.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = ""
        let titletext = "ALIAS"
        var charNumber = 0.0
        for letter in titletext {
            Timer.scheduledTimer(withTimeInterval: 0.5 * charNumber, repeats: false) { timer in
                self.titleLabel.text?.append(letter)
            }
            charNumber += 1
        }
    }
    @IBAction func startGameButton(_ sender: UIButton) {
    }
}

