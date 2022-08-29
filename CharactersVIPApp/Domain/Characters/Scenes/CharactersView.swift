//
//  ContentView.swift
//  ServiceLocator
//
//  Created by Андрей on 03.07.2022.
//

import SwiftUI

protocol CharactersDisplayLogic {
    func displayCharacters(viewModel: DisplayCharacters.LoadCharacters.ViewModel)
}

extension CharactersView: CharactersDisplayLogic {
    func displayCharacters(viewModel: DisplayCharacters.LoadCharacters.ViewModel) {
        charactersDataStore.displayedCharactersNames = viewModel.characterNames
    }
}

struct CharactersView: View {
    var interactor: DisplayCharactersBusinessLogic?
	
    @ObservedObject var charactersDataStore: CharacterDataStore = .init()
	
	var body: some View {
        NavigationView {
            List {
                ForEach(charactersDataStore.displayedCharactersNames, id: \.self) { character in
                    Text(character)
                }
            }
            .navigationTitle("Characters")
        }
		.onAppear {
            interactor?.loadCharacters(request: .init())
		}
	} // body
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		CharactersView()
	}
}
