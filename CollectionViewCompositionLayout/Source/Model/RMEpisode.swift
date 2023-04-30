//
//  RMEpisode.swift
//  CollectionViewCompositionLayout
//
//  Created by Rogerio Martins on 30/04/23.
//

import Foundation

// MARK: - RMEpisode
struct RMEpisode: Codable {
    let info: InfoEpisode?
    let results: [ResultEpisode]?
}

// MARK: - InfoEpisode
struct InfoEpisode: Codable {
    let count, pages: Int?
    let next, prev: String?
}

// MARK: - ResultEpisode
struct ResultEpisode: Codable {
    let id: Int?
    let name, airDate, episode: String?
    let characters: [String]?
    let url: String?
    let created: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case airDate = "air_date"
        case episode, characters, url, created
    }
}
