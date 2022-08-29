//
//  CharactersViewConfigurator.swift
//  ServiceLocator
//
//  Created by Андрей Парчуков on 29.08.2022.
//

import SwiftUI

extension CharactersView {
    func configureView() -> some View {
        var view = self
        let interactor = DisplayCharacterInteractor()
        let presenter = DisplayCharactersPresenter()
        view.interactor = interactor
        interactor.presenter = presenter
        interactor.characterNetworkWorker = CharactersNetworkWorker()
        interactor.characterRealmWorker = CharacterRealmWorker()
        presenter.view = view
        
        return view
    }
}
