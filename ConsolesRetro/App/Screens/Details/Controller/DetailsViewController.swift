//
//  DetailsViewController.swift
//  ConsolesRetro
//
//  Created by Diggo Silva on 21/05/24.
//

import UIKit

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
        title = "Jogos"
        view.backgroundColor = .systemBackground
    }
    
    func setDelegatesAndDataSources() {
        detailsView.tableView.delegate = self
        detailsView.tableView.dataSource = self
    }
}

extension DetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailsCell.identifier, for: indexPath) as? DetailsCell else { return UITableViewCell() }
        cell.configure(jogo: viewModel.cellForRowAt(cellForRowAt: indexPath))
        tableView.reloadData()
        return cell
    }
}
