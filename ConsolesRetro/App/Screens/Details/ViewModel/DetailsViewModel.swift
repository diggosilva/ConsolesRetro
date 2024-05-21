//
//  DetailsViewModel.swift
//  ConsolesRetro
//
//  Created by Diggo Silva on 21/05/24.
//

import Foundation

protocol DetailsViewModelProtocol {
    
}

class DetailsViewModel: DetailsViewModelProtocol {
    
    private let feedConsole: FeedConsole
    
    init(feedConsole: FeedConsole) {
        self.feedConsole = feedConsole
    }
    
}
