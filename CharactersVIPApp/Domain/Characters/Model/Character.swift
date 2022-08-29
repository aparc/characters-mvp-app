//
//  ModelCharacter.swift
//  ServiceLocator
//
//  Created by Андрей on 04.07.2022.
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct Character: Codable, Hashable {

	public var charId: Double
	public var name: String

	public init(charId: Double, name: String) {
		self.charId = charId
		self.name = name
		
	}

	public enum CodingKeys: String, CodingKey, CaseIterable {
		case charId = "char_id"
		case name
	}

	// Encodable protocol methods

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(charId, forKey: .charId)
		try container.encode(name, forKey: .name)
	}
}
