//
//  DetailsViewController.swift
//  ConsolesRetro
//
//  Created by Diggo Silva on 21/05/24.
//

import UIKit

class DetailsViewController: UIViewController {
    
    let detailsView = DetailsView()
    
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
        title = "Consoles Retro"
        view.backgroundColor = .systemBackground
    }
    
    func setDelegatesAndDataSources() {
        detailsView.tableView.delegate = self
        detailsView.tableView.dataSource = self
    }
    
}

extension DetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "JOGOS AQUI"
        return cell
    }
}
