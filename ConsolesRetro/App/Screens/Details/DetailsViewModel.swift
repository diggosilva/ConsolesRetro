//
//  DetailsViewModel.swift
//  ConsolesRetro
//
//  Created by Diggo Silva on 21/05/24.
//

import Foundation

enum CellType {
    case console(FeedConsole)
    case game(Game)
}

protocol DetailsViewModelProtocol {
    func getNameConsole() -> String 
    func numberOfRowsInSection() -> Int
    func cellTypeFor(indexPath: IndexPath) -> CellType
}

class DetailsViewModel: DetailsViewModelProtocol {
    private var console: FeedConsole
    private var cells: [CellType] = []
    
    init(console: FeedConsole) {
        self.console = console
        self.cells.append(CellType.console(console))
        self.cells.append(contentsOf: console.games.compactMap({ CellType.game($0) }))
    }
    
    func getNameConsole() -> String {
        return "Jogos de \(console.name)"
    }
    
    func numberOfRowsInSection() -> Int {
        return cells.count
    }
    
    func cellTypeFor(indexPath: IndexPath) -> CellType {
        return cells[indexPath.row]
    }
}
