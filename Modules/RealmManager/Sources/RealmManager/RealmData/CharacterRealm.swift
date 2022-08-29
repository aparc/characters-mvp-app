//
//  CharacterRealm.swift
//  ServiceLocator
//
//  Created by Андрей Парчуков on 29.08.2022.
//

import RealmSwift

public class CharacterRealm: Object {
    @Persisted public var charId: Double = 0
    @Persisted public var name: String = ""
}
