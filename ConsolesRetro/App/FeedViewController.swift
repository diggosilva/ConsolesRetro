//
//  ViewController.swift
//  ConsolesRetro
//
//  Created by Diggo Silva on 21/05/24.
//

import UIKit

class FeedViewController: UIViewController {
    
    let feedView = FeedView()
    let viewModel = FeedViewModel()
    
    override func loadView() {
        super.loadView()
        view = feedView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavBar()
        setDelegatesAndDatasources()
        handleStates()
        viewModel.loadData()
    }
    
    func setNavBar() {
        title = "Consoles"
        view.backgroundColor = .systemBackground
    }
    
    func setDelegatesAndDatasources() {
        feedView.tableView.delegate = self
        feedView.tableView.dataSource = self
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
        feedView.removeFromSuperview()
    }
    
    private func showLoadedState() {
        feedView.spinner.stopAnimating()
        feedView.tableView.reloadData()
    }
    
    private func showErrorState() {
        let alert = UIAlertController(title: "Opa, ocorreu um erro!", message: "Tentar novamente?", preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "Sim", style: .default) { action in
            print("Tentou novamente")
        }
        let nok = UIAlertAction(title: "Não", style: .cancel) { action in
            print("Desistiu de tentar")
        }
        alert.addAction(ok)
        alert.addAction(nok)
        present(alert, animated: true)
    }
}

extension FeedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "TESTE GAME"
        return cell
    }
}
