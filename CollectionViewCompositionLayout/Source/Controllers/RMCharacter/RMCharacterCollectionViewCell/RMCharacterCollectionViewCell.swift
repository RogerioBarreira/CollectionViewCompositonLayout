//
//  RMCharacterCollectionViewCell.swift
//  CollectionViewCompositionLayout
//
//  Created by Rogerio Martins on 30/04/23.
//

import UIKit
import Kingfisher

class RMCharacterCollectionViewCell: UICollectionViewCell {
    
    let imageCharacter: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        image.layer.cornerRadius = 12
        image.clipsToBounds = true
        return image
    }()
    
    let titleContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .tertiarySystemBackground
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    static let identifier = "RMCharacterCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.layer.masksToBounds = true
        contentView.layer.cornerRadius = 12
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    func configConstraints() {
        setupImage()
        setupTitleView()
        setupTitleLabel()
    }
    
    func setupImage() {
        contentView.addSubview(imageCharacter)
        NSLayoutConstraint.activate([
            imageCharacter.topAnchor.constraint(equalTo: self.topAnchor),
            imageCharacter.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageCharacter.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            //imageCharacter.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
        ])
    }
    
    func setupTitleView() {
        contentView.addSubview(titleContainerView)
        NSLayoutConstraint.activate([
            titleContainerView.topAnchor.constraint(equalTo: imageCharacter.bottomAnchor, constant: -10),
            titleContainerView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            titleContainerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleContainerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            titleContainerView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.15)
        ])
    }
    
    func setupTitleLabel() {
        titleContainerView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: titleContainerView.leadingAnchor, constant: 5),
            titleLabel.trailingAnchor.constraint(equalTo: titleContainerView.trailingAnchor, constant: -5),
            titleLabel.centerYAnchor.constraint(equalTo: titleContainerView.centerYAnchor)
        ])
    }
    
    func setupCell(image: Result?) {
        if let url = URL(string: image?.image ?? "") {
            imageCharacter.kf.indicatorType = .activity
            imageCharacter.kf.setImage(with: url)
        } else {
            imageCharacter.image = nil
        }
        titleLabel.text = image?.status?.rawValue
    }
}
