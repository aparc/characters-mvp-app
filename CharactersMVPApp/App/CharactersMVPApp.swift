//
//  ServiceLocatorApp.swift
//  ServiceLocator
//
//  Created by Андрей on 03.07.2022.
//

import SwiftUI

@main
struct CharactersMVPApp: App {
	
    var body: some Scene {
        WindowGroup {
            CharactersView().configureView()
        }
    }
}
