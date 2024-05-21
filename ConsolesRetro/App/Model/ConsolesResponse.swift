//
//  ConsolesResponse.swift
//  ConsolesRetro
//
//  Created by Diggo Silva on 21/05/24.
//

import Foundation

struct ConsolesResponse: Codable {
    let consoles: [Console]
    
    struct Console: Codable {
        let name: String
        let image: String
        let jogos: [Jogo]
    }
    
    struct Jogo: Codable {
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
}
