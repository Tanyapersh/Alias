//
//  Factory.swift
//  Alias
//
//  Created by Таня on 23.05.2022.
//

import Foundation

enum Categories {
    case animals
    case clothes
    case countries
    case professions
}

class Factory {
    
    static let shared = Factory()
    
    func getCategory (category: Categories) -> Category{
        switch category {
        case .animals:
            return Animals()
        case .clothes:
            return Clothes()
        case .countries:
            return Countries()
        case .professions:
            return Professions()
        }
    }
}
