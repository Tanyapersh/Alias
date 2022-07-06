//
//  Category.swift
//  Alias
//
//  Created by Таня on 23.05.2022.
//

import Foundation

protocol Category {
    var name: [String] {get set}
    var numbOfName: Int {get set}
    var scoreNumber: Int {get set}
    mutating func getName() -> String
    mutating func scoreCount (answer: Bool) -> Int
}
