//
//  LoadCharactersModel.swift
//  ServiceLocator
//
//  Created by Андрей Парчуков on 29.08.2022.
//

import Foundation

enum DisplayCharacters {
    
    enum LoadCharacters {
        struct Request {}
        
        struct Response {
            let characters: [Character]
        }
        
        struct ViewModel {
            let characterNames: [String]
        }
    }
    
}
