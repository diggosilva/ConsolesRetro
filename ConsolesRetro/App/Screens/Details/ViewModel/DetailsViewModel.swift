//
//  DetailsViewModel.swift
//  ConsolesRetro
//
//  Created by Diggo Silva on 21/05/24.
//

import Foundation

protocol DetailsViewModelProtocol {
    func getNameConsole() -> String 
    func numberOfSection() -> Int
    func numberOfRowsInSection(numberOfRowsInSection section: Int) -> Int
    func cellTypeFor(indexPath: IndexPath) -> CellType
    func tableView(titleForHeaderInSection section: Int) -> String?
}

class DetailsViewModel: DetailsViewModelProtocol {
    private let console: FeedConsole
    private var sections: [Section] = []
    
    init(console: FeedConsole) {
        self.console = console
        let consoleSection = Section(title: .consoles, cells: console.consoles.compactMap({ CellType.console($0) }))
        let gameSection = Section(title: .games, cells: console.consoles[0].games.compactMap({ CellType.game($0) }))
        sections.append(consoleSection)
        sections.append(gameSection)
    }
    
    func getNameConsole() -> String {
        return "Jogos de \(console.consoles[0].name)"
    }
    
    func numberOfSection() -> Int {
        return sections.count
    }
    
    func numberOfRowsInSection(numberOfRowsInSection section: Int) -> Int {
        return sections[section].cells.count
    }
    
    func cellTypeFor(indexPath: IndexPath) -> CellType {
        let section = sections[indexPath.section]
        let cell = section.cells[indexPath.row]
        return cell
    }
    
    func tableView(titleForHeaderInSection section: Int) -> String? {
        return "\(sections[section].title)".capitalized
    }
}
