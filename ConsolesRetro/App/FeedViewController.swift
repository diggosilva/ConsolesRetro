//
//  ViewController.swift
//  ConsolesRetro
//
//  Created by Diggo Silva on 21/05/24.
//

import UIKit

class FeedViewController: UIViewController {
    
    let viewModel = FeedViewModel()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Carregando..."
        label.textColor = .systemRed
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        handleStates()
        viewModel.loadData()
    }
    
    func handleStates() {
        viewModel.state.bind { states in
            switch states {
            case .loading:
                return self.showLoadingState()
            case .loaded:
                return self.showLoadedState()
            case .error:
                return self.showErrorState()
            }
        }
    }
    
    private func showLoadingState() {
        
    }
    
    private func showLoadedState() {
        label.textColor = .systemGreen
        label.text = viewModel.newLabel
    }
    
    private func showErrorState() {
        
    }

}
