//
//  Animals.swift
//  Alias
//
//  Created by Таня on 23.05.2022.
//

import Foundation
 
struct Animals: Category {
    var name: [String] = ["Панда", "Ленивец", "Медведь", "Лиса", "Крыса", "Альпака", "Броненосец", "Тигр", "Волк", "Кенгуру", "Заяц", "Олень", "Жираф", "Лев", "Кабан"]
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
