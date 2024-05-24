//
//  DetailsViewController.swift
//  ConsolesRetro
//
//  Created by Diggo Silva on 21/05/24.
//

import UIKit
import SafariServices

class DetailsViewController: UIViewController {
    
    let detailsView = DetailsView()
    let viewModel: DetailsViewModelProtocol
    
    init(console: [Console]) {
        self.viewModel = DetailsViewModel(console: console)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = detailsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavBar()
        setDelegatesAndDataSource()
    }
    
    private func setNavBar() {
        title = viewModel.getNameConsole()
        view.backgroundColor = .systemBackground
    }
    
    private func setDelegatesAndDataSource() {
        detailsView.tableView.delegate = self
        detailsView.tableView.dataSource = self
    }
    
    private func showTitleScreenVideo(url: String) {
        guard let url = URL(string: url) else { return }
        let config = SFSafariViewController.Configuration()
        config.entersReaderIfAvailable = true
        let vc = SFSafariViewController(url: url, configuration: config)
        present(vc, animated: true)
    }
    
    private func getCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell? {
        let cellType = viewModel.cellTypeFor(indexPath: indexPath)
        
        switch cellType {
        case .console(let console):
            let consoleCell = tableView.dequeueReusableCell(withIdentifier: DetailsConsoleCell.identifier, for: indexPath) as? DetailsConsoleCell
            consoleCell?.configure(console: console)
            return consoleCell
        case .game(let game):
            let gameCell = tableView.dequeueReusableCell(withIdentifier: DetailsGameCell.identifier, for: indexPath) as? DetailsGameCell
            gameCell?.configure(game: game)
            return gameCell
        }
    }
}

extension DetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(numberOfRowsInSection: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return getCell(tableView: tableView, indexPath: indexPath) ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cellType = viewModel.cellTypeFor(indexPath: indexPath)
        
        if case .game(let jogo) = cellType {
            showTitleScreenVideo(url: jogo.youtubeLink)
        }
    }
}
