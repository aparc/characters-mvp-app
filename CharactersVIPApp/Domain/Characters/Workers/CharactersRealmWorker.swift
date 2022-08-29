//
//  CharactersRealmWorker.swift
//  ServiceLocator
//
//  Created by Андрей Парчуков on 29.08.2022.
//

import Foundation
import RealmManager

class CharacterRealmWorker {
    
    func getCharacters() -> [Character] {
        print("Attempt to load characters by Realm")
        let characters = RealmManager.shared.objects(CharacterRealm.self)
            .map {
                Character(charId: $0.charId, name: $0.name)
            }
        print("Data count from Realm: \(characters.count)")
        
        return Array(characters)
    }
    
    func save(characters: [Character]) {
        let realmData = characters.map {
            CharacterRealm(value: [$0.charId, $0.name])
        }
        RealmManager.shared.write {
            RealmManager.shared.realm.add(realmData)
        }
    }
    
}


