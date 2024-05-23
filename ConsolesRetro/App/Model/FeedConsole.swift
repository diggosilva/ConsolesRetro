//
//  FeedConsole.swift
//  ConsolesRetro
//
//  Created by Diggo Silva on 21/05/24.
//

import Foundation

struct FeedConsole {
    let consoles: [Console]
}

struct Console {
    let name: String
    let image: String
    let games: [Game]
}

struct Game {
    let name: String
    let image: String
    let youtubeLink: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case name, image
        case youtubeLink = "youtube_link"
        case description
    }
}
