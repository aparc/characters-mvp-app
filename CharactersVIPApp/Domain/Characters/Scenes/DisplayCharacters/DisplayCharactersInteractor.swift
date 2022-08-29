//
//  DisplayCharactersInteractor.swift
//  ServiceLocator
//
//  Created by Андрей Парчуков on 29.08.2022.
//

import Foundation

protocol DisplayCharactersBusinessLogic {
    func loadCharacters(request: DisplayCharacters.LoadCharacters.Request)
}

class DisplayCharacterInteractor {
    var presenter: DisplayCharactersPresentationLogic?
    
    var characterRealmWorker: CharacterRealmWorker?
    var characterNetworkWorker: CharactersNetworkWorker?
}

extension DisplayCharacterInteractor: DisplayCharactersBusinessLogic {
    
    func loadCharacters(request: DisplayCharacters.LoadCharacters.Request) {
        var characters = characterRealmWorker?.getCharacters() ?? []

        if characters.isEmpty {
            print("Attempt to fetch data from server")
            
            characterNetworkWorker?.fetchAllCharacters { [unowned self] in
                guard let loadedCharacters = $0, !loadedCharacters.isEmpty else {
                    print("No data from server")
                    return
                }
                
                characters = loadedCharacters
                print("Data count loaded from server: \(loadedCharacters.count)")
                
                characterRealmWorker?.save(characters: characters)
                presenter?.presentCharacters(response: .init(characters: characters))
            }
        } else {
            presenter?.presentCharacters(response: .init(characters: characters))
        }
    }
    
}
