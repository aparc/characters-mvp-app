//
//  DisplayCharactersPresenter.swift
//  ServiceLocator
//
//  Created by Андрей Парчуков on 29.08.2022.
//

import Foundation

protocol DisplayCharactersPresentationLogic {
    func presentCharacters(response: DisplayCharacters.LoadCharacters.Response)
}

class DisplayCharactersPresenter {
    var view: CharactersDisplayLogic?
}

extension DisplayCharactersPresenter: DisplayCharactersPresentationLogic {
    func presentCharacters(response: DisplayCharacters.LoadCharacters.Response) {
        let names = response.characters.map { $0.name }
        view?.displayCharacters(
            viewModel: .init(characterNames: names)
        )
    }
}
