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
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "O Mega Drive foi lançado em 1988, uma grande inovação pra época, trazendo grande titulos do arcade para o conforto da sua casa. Tudo isso e muito mais!!!"
        label.textAlignment = .justified
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(console: Console) {
        guard let url = URL(string: console.image) else { return }
        consoleImage.sd_setImage(with: url)
        nameLabel.text = console.name
//        descriptionLabel.text = console.description
    }
    
    private func setupView() {
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy () {
        addSubview(consoleImage)
        addSubview(nameLabel)
        addSubview(descriptionLabel)
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
            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
        ])
    }
}
