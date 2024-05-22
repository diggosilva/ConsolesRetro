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
    
    init(feedConsole: FeedConsole) {
        self.viewModel = DetailsViewModel(feedConsole: feedConsole)
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
        setDelegatesAndDataSources()
    }
    
    func setNavBar() {
        title = "Jogos de \(viewModel.getNameConsole())"
        view.backgroundColor = .systemBackground
    }
    
    func setDelegatesAndDataSources() {
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
}

extension DetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailsCell.identifier, for: indexPath) as? DetailsCell else { return UITableViewCell() }
        cell.configure(jogo: viewModel.cellForRowAt(cellForRowAt: indexPath))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = viewModel.cellForRowAt(cellForRowAt: indexPath)
        showTitleScreenVideo(url: cell.youtubeLink)
    }
}
