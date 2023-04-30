//
//  RMLocation.swift
//  CollectionViewCompositionLayout
//
//  Created by Rogerio Martins on 30/04/23.
//

import Foundation

// MARK: - RMLocation
struct RMLocation: Codable {
    let info: InfoLocation?
    let results: [ResultLocation]?
}

// MARK: - InfoLocation
struct InfoLocation: Codable {
    let count, pages: Int?
    let next, prev: String?
}

// MARK: - ResultLocation
struct ResultLocation: Codable {
    let id: Int?
    let name, type, dimension: String?
    let residents: [String]?
    let url: String?
    let created: String?
}
