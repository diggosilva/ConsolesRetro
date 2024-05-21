//
//  FeedCell.swift
//  ConsolesRetro
//
//  Created by Diggo Silva on 21/05/24.
//

import UIKit

class FeedCell: UITableViewCell {
    static let identifier = "FeedCell"
    
    lazy var consoleImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.image = UIImage(systemName: "person.fill")
        image.backgroundColor = .lightGray
        image.layer.cornerRadius = 40
        image.clipsToBounds = true
        return image
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "NOME DO CONSOLE"
        label.font = .italicSystemFont(ofSize: 20)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy () {
        addSubview(consoleImage)
        addSubview(nameLabel)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            consoleImage.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            consoleImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            consoleImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            consoleImage.widthAnchor.constraint(equalToConstant: 80),
            consoleImage.heightAnchor.constraint(equalTo: consoleImage.widthAnchor),
            
            nameLabel.centerYAnchor.constraint(equalTo: consoleImage.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: consoleImage.trailingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
}
