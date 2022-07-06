//
//  CategoryViewController.swift
//  Alias
//
//  Created by Таня on 17.05.2022.
//

import UIKit

class CategoryViewController: UIViewController {
    
    var gameVC = GameViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func animalButton(_ sender: UIButton) {
        performSegue(withIdentifier: "animalsSegue", sender: self)
    }
    
    @IBAction func professionButton(_ sender: UIButton) {
        performSegue(withIdentifier: "professionsSegue", sender: self)
        
    }
    
    
    @IBAction func countryButton(_ sender: UIButton) {
        performSegue(withIdentifier: "countriesSegue", sender: self)
    }
    
    @IBAction func clothesButton(_ sender: UIButton) {
        performSegue(withIdentifier: "clothersSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! GameViewController
        var myCategory: Category = Animals()
        
        if segue.identifier == "animalsSegue" {
            myCategory = Factory.shared.getCategory(category: .animals)
        }
        else if segue.identifier == "professionsSegue" {
            myCategory = Factory.shared.getCategory(category: .professions)
        }
        else if segue.identifier == "countriesSegue" {
            myCategory = Factory.shared.getCategory(category: .countries)
        }
        else if segue.identifier == "clothersSegue" {
            myCategory = Factory.shared.getCategory(category: .clothes)
        }
        else{
            print("ERROR: Unknown identifier")
            return
        }
        destinationVC.category = myCategory
        destinationVC.wordText = myCategory.name.first
    }
}
