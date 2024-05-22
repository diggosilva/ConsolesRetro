//
//  DetailsViewModel.swift
//  ConsolesRetro
//
//  Created by Diggo Silva on 21/05/24.
//

import Foundation

protocol DetailsViewModelProtocol {
    func getNameConsole() -> String 
    func numberOfRowsInSection() -> Int
    func cellForRowAt(cellForRowAt indexPath: IndexPath) -> Jogo
}

class DetailsViewModel: DetailsViewModelProtocol {
 
    private let feedConsole: FeedConsole
    private var jogos: [Jogo] = []
    
    init(feedConsole: FeedConsole) {
        self.feedConsole = feedConsole
        self.jogos = feedConsole.jogos
    }
    
    func getNameConsole() -> String {
        return feedConsole.name
    }
    
    func numberOfRowsInSection() -> Int {
        return jogos.count
    }
    
    func cellForRowAt(cellForRowAt indexPath: IndexPath) -> Jogo {
        return jogos[indexPath.row]
    }
}
