//
//  Section.swift
//  ConsolesRetro
//
//  Created by Diggo Silva on 22/05/24.
//

import Foundation

enum TitleHeaderSection: String {
    case consoles
    case games
}

enum CellType {
    case console(Console)
    case game(Game)
}

struct Section {
    var title: TitleHeaderSection
    var cells: [CellType]
    
    init(title: TitleHeaderSection, cells: [CellType]) {
        self.title = title
        self.cells = cells
    }
}
