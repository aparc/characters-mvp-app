//
//  CharacterDataStore.swift
//  ServiceLocator
//
//  Created by Андрей Парчуков on 29.08.2022.
//

import Foundation

class CharacterDataStore: ObservableObject {
    @Published var displayedCharactersNames: [String] = []
}
