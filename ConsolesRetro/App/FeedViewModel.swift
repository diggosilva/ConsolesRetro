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
    
    func loadData() {
      
    }
}
