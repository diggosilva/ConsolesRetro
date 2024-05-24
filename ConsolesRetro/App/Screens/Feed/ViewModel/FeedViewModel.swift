//
//  FeedViewModel.swift
//  ConsolesRetro
//
//  Created by Diggo Silva on 21/05/24.
//

import Foundation

protocol FeedViewModelProtocol {
    var state: Bindable<FeedViewControllerStates> { get set }
    func numberOfRowsInSection() -> Int
    func cellForRowAt() -> Console
}

enum FeedViewControllerStates {
    case loading
    case loaded
    case error
}

class FeedViewModel {
    private (set) var state: Bindable<FeedViewControllerStates> = Bindable(value: .loading)
    private var service: ServiceProtocol = Service()
    private var consolesList: [Console] = []
    
    func numberOfRowsInSection() -> Int {
        return consolesList.count
    }
    
    func cellForRowAt(indexPath: IndexPath) -> Console {
        return consolesList[indexPath.row]
    }
    
    func loadDataConsoles() {
        service.getConsoles { feedConsoles in
            self.consolesList = feedConsoles
            self.state.value = .loaded
        } onError: { error in
            self.state.value = .error
        }
    }
}
