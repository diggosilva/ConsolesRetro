//
//  FeedViewModelTests.swift
//  FeedViewModelTests
//
//  Created by Diggo Silva on 05/12/24.
//

import XCTest
@testable import ConsolesRetro

class MockSuccess: ServiceProtocol {
    func getConsoles(onSuccess: @escaping([FeedConsole]) -> Void, onError: @escaping(Error) -> Void) {
        onSuccess([
            FeedConsole(name: "PlayStation 5", description: "", image: "", games: []),
            FeedConsole(name: "Xbox Series X", description: "", image: "", games: []),
        ])
    }
}

class MockFailure: ServiceProtocol {
    func getConsoles(onSuccess: @escaping([FeedConsole]) -> Void, onError: @escaping(Error) -> Void) {
        onError(NSError(domain: "", code: 0))
    }
}

final class FeedViewModelTests: XCTestCase {
    func testWhenSuccess() {
        let sut: FeedViewModel = FeedViewModel(serviceProtocol: MockSuccess())
        if sut.state.value == .error {
            sut.loadDataConsoles()
            
            XCTAssertEqual(sut.numberOfRowsInSection(), 2)
            
            let firstConsole = sut.cellForRowAt(indexPath: IndexPath(row: 0, section: 0))
            let secondConsole = sut.cellForRowAt(indexPath: IndexPath(row: 1, section: 0))
            
            XCTAssertEqual(firstConsole.name, "PlayStation 5")
            XCTAssertEqual(secondConsole.name, "Xbox Series X")
        } else {
            sut.state.value = .error
        }
    }
    
    func testblabla() {
        let valor = 1 == 1
        XCTAssertTrue(valor)
    }
    
    func testWhenError() {
        let sut: FeedViewModel = FeedViewModel(serviceProtocol: MockFailure())
        sut.state.bind { state in
            XCTAssertEqual(state, .error)
        }
        sut.loadDataConsoles()
        XCTAssertEqual(sut.state.value, .error)
    }
}
