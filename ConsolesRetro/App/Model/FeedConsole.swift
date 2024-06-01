//
//  Console.swift
//  ConsolesRetro
//
//  Created by Diggo Silva on 21/05/24.
//

import Foundation

struct FeedConsole {
    let name, description: String
    let image: String
    let games: [Game]
    
    var imageUrl: URL? {
        guard let url = URL(string: image) else { return nil }
        return url
    }
    
    var totalGamesLabelText: String {
        return "Total de jogos na lista: \(games.count)"
    }
}

struct Game {
    let name: String
    let image: String
    let youtubeLink: String
    let description: String
    
    var imageUrl: URL? {
        guard let url = URL(string: image) else { return nil }
        return url
    }
    
    enum CodingKeys: String, CodingKey {
        case name, image
        case youtubeLink = "youtube_link"
        case description
    }
}
