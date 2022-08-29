//
//  CharactersNetworkService.swift
//  ServiceLocator
//
//  Created by Андрей on 04.07.2022.
//

import Foundation
import APIManager

class CharactersNetworkWorker {
	
	private let basePath = "https://www.breakingbadapi.com/api"
	
	func fetchAllCharacters(completion: @escaping ([Character]?) -> Void) {
        APIManager.shared.fetch(url: "\(basePath)/characters/", method: "GET", handler: completion)
	}
	
}
