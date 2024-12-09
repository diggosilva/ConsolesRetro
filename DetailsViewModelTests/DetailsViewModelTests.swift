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
        
        let rowsInSection = sut.numberOfRowsInSection(numberOfRowsInSection: 10)
        
        XCTAssertEqual(rowsInSection, 2)
    }
}
