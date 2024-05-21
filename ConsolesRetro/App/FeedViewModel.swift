//
//  FeedViewModel.swift
//  ConsolesRetro
//
//  Created by Diggo Silva on 21/05/24.
//

import Foundation

protocol FeedViewModelProtocol {
    var state: Bindable<FeedViewControllerStates> { get set }
}

enum FeedViewControllerStates {
    case loading
    case loaded
    case error
}

class FeedViewModel {
    var state: Bindable<FeedViewControllerStates> = Bindable(value: .loading)
    
    var newLabel = ""
    
    func loadData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.newLabel = "Carregado!!!"
            self.state.value = .loaded
        }
    }
}
