//
//  DetailsCell.swift
//  ConsolesRetro
//
//  Created by Diggo Silva on 21/05/24.
//

import UIKit
import SDWebImage

class DetailsGameCell: UITableViewCell {
    static let identifier = "DetailsGameCell"
    
    lazy var coverImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        return image
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .preferredFont(forTextStyle: .headline)
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .secondaryLabel
        label.font = .preferredFont(forTextStyle: .footnote)
        return label
    }()
    
    lazy var vStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [nameLabel, descriptionLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 10
        stack.distribution = .fill
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(game: Game) {
        coverImage.sd_setImage(with: game.imageUrl)
        nameLabel.text = game.name
        descriptionLabel.text = game.description
    }
    
    private func setupView() {
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy () {
        addSubview(coverImage)
        addSubview(vStack)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            coverImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            coverImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            coverImage.widthAnchor.constraint(equalToConstant: 80),
            coverImage.heightAnchor.constraint(equalTo: coverImage.widthAnchor),
            
            vStack.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            vStack.leadingAnchor.constraint(equalTo: coverImage.trailingAnchor, constant: 10),
            vStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            vStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
        ])
    }
}
