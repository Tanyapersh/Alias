//
//  Professions.swift
//  Alias
//
//  Created by Таня on 23.05.2022.
//

import Foundation

struct Professions: Category{
    var name: [String] = ["Журналист", "Блогер", "Кардиохирург", "Философ", "Пекарь", "Татуировщик", "Часовщик", "Бортпроводник", "Детектив", "Переводчик", "Ректор", "SMM-менеджер", "Телохранитель", "Радиоведущий", "Дерматолог"]
    var numbOfName: Int = 1
    var scoreNumber = 0
    
    mutating func getName() -> String {
        guard numbOfName < name.count - 1 else {return "Конец"}
        return name[numbOfName]
    }
    
    mutating func scoreCount(answer: Bool) -> Int {
        guard numbOfName < name.count - 1 else {return scoreNumber}
        if answer {
            scoreNumber += 1
        }
        else {
            scoreNumber -= 1
        }
        return scoreNumber
    }
}
