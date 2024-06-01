//
//  DetailsConsoleCell.swift
//  ConsolesRetro
//
//  Created by Diggo Silva on 22/05/24.
//

import UIKit
import SDWebImage

class DetailsConsoleCell: UITableViewCell {
    static let identifier = "DetailsConsoleCell"
    
    lazy var consoleImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        return image
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .preferredFont(forTextStyle: .headline)
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .justified
        label.textColor = .secondaryLabel
        label.font = .preferredFont(forTextStyle: .footnote)
        return label
    }()
    
    lazy var totalGamesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .footnote)
        return label
    }()
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(console: FeedConsole) {
        consoleImage.sd_setImage(with: console.imageUrl)
        nameLabel.text = console.name
        descriptionLabel.text = console.description
        totalGamesLabel.text = console.totalGamesLabelText
    }
    
    private func setupView() {
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy () {
        backgroundColor = .systemGreen.withAlphaComponent(0.2)
        addSubview(consoleImage)
        addSubview(nameLabel)
        addSubview(descriptionLabel)
        addSubview(totalGamesLabel)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            consoleImage.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            consoleImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            consoleImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            consoleImage.heightAnchor.constraint(equalToConstant: 150),
            
            nameLabel.topAnchor.constraint(equalTo: consoleImage.bottomAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: consoleImage.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: consoleImage.trailingAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: consoleImage.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: consoleImage.trailingAnchor),
            
            totalGamesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            totalGamesLabel.leadingAnchor.constraint(equalTo: consoleImage.leadingAnchor),
            totalGamesLabel.trailingAnchor.constraint(equalTo: consoleImage.trailingAnchor),
            totalGamesLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
        ])
    }
}
