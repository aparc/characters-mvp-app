//
//  CharacterRealm.swift
//  ServiceLocator
//
//  Created by Андрей Парчуков on 29.08.2022.
//

import Foundation
import RealmSwift

class CharacterRealm: Object {
    @Persisted var charId: Double = 0
    @Persisted var name: String = ""
}
