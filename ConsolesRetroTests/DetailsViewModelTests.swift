//
//  DetailsViewModelTests.swift
//  DetailsViewModelTests
//
//  Created by Diggo Silva on 08/12/24.
//

import XCTest
@testable import ConsolesRetro

final class DetailsViewModelTests: XCTestCase {
    
    func testGetNameConsole() {
        let sut: DetailsViewModel = DetailsViewModel(console: FeedConsole(name: "Mega Drive", description: "", image: "", games: []))
        XCTAssertEqual(sut.getNameConsole(), "Jogos de Mega Drive")
    }
    
    func testNumberOfRowsInSection() {
        let sut: DetailsViewModel = DetailsViewModel(console: FeedConsole(name: "Mega Drive", description: "", image: "", games: [
            Game(name: "Quackshot", image: "", youtubeLink: "", description: "")
        ]))
        
        let rowsInSection = sut.numberOfRowsInSection()
        XCTAssertEqual(rowsInSection, 2)
    }
    
    func testCellTypeFor() {
        let game = Game(name: "Quackshot", image: "", youtubeLink: "", description: "")
        let console = FeedConsole(name: "Mega Drive", description: "", image: "", games: [game])
        let sut: DetailsViewModel = DetailsViewModel(console: console)
        
        let cellTypeForConsole = sut.cellTypeFor(indexPath: IndexPath(row: 0, section: 0))
        let cellTypeForGame = sut.cellTypeFor(indexPath: IndexPath(row: 1, section: 0))
        
        XCTAssertTrue(cellTypeForConsole == .console(console))
    }
}

extension CellType: @retroactive Equatable {
    
  public static func == (lhs: CellType, rhs: CellType) -> Bool {
        switch (lhs, rhs) {
        case let (.console(lhsConsole), .console(rhsConsole)):
          return lhsConsole.name == rhsConsole.name
        case let (.game(lhsGame), .game(rhsGame)):
          return lhsGame.name == rhsGame.name
        default:
            return false
        }
    }
}
