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
        let sut: DetailsViewModel = DetailsViewModel(console: FeedConsole(name: "Mega Drive", description: "", image: "", games: [
            Game(name: "Quackshot", image: "", youtubeLink: "", description: "")
        ]))
        
        let cellTypeForConsole = sut.cellTypeFor(indexPath: IndexPath(row: 0, section: 0))
        let cellTypeForGame = sut.cellTypeFor(indexPath: IndexPath(row: 1, section: 0))
        
        if case .console(let console) = cellTypeForConsole {
            XCTAssertTrue(console.name.contains("Mega Drive"))
        } else {
            fatalError("O esperado é um tipo da celula seja .console")
        }
        
        if case .game(let game) = cellTypeForGame {
            XCTAssertTrue(game.name.contains("Quackshot"))
        } else {
            fatalError("O esperado é um tipo da celula seja .game")
        }
    }
    
    func testDoCaralhus() {
        let sut: DetailsViewModel = DetailsViewModel(console: FeedConsole(name: "Mega Drive", description: "", image: "", games: [
            Game(name: "Quackshot", image: "", youtubeLink: "", description: "")
        ]))
        
        let cellTypeForConsole = sut.cellTypeFor(indexPath: IndexPath(row: 0, section: 0))
        let cellTypeForGame = sut.cellTypeFor(indexPath: IndexPath(row: 1, section: 0))
        
        
    }
}
