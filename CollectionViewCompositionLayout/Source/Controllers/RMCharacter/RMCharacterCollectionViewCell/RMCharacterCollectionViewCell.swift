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
    
    static let identifier = "RMCharacterCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configConstraints() {
        setupImage()
    }
    
    func setupImage() {
        contentView.addSubview(imageCharacter)
        NSLayoutConstraint.activate([
            imageCharacter.topAnchor.constraint(equalTo: self.topAnchor),
            imageCharacter.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageCharacter.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imageCharacter.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
        ])
    }
    
    func setupCell(image: Result?) {
        if let url = URL(string: image?.image ?? "") {
            imageCharacter.kf.indicatorType = .activity
            imageCharacter.kf.setImage(with: url)
        } else {
            imageCharacter.image = nil
        }
    }
}
