//
//  RMCharacterView.swift
//  CollectionViewCompositionLayout
//
//  Created by Rogerio Martins on 30/04/23.
//

import UIKit

class RMCharacterView: UIView {
    
    let loading: UIActivityIndicatorView = {
        let load = UIActivityIndicatorView(style: .large)
        load.translatesAutoresizingMaskIntoConstraints = false
        load.color = .blue
        load.backgroundColor = .clear
        return load
    }()
    
    let myCollectionView: UICollectionView = {
        let collection = UICollectionView(
            frame: .zero,
            collectionViewLayout: RMCharacterView.createLayout()
        )
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .clear
        return collection
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configContraints() {
        setupCollectionView()
        setupLoad()
    }
    
    func setupCollectionView() {
        addSubview(myCollectionView)
        NSLayoutConstraint.activate([
            myCollectionView.topAnchor.constraint(equalTo: self.topAnchor),
            myCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            myCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            myCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    func setupLoad() {
        addSubview(loading)
        NSLayoutConstraint.activate([
            loading.centerXAnchor.constraint(equalTo: myCollectionView.centerXAnchor),
            loading.centerYAnchor.constraint(equalTo: myCollectionView.centerYAnchor)
        ])
    }
    
    static func createLayout() -> UICollectionViewCompositionalLayout {
        
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(2/3),
                heightDimension: .fractionalHeight(1)
            )
        )
        
        item.contentInsets = NSDirectionalEdgeInsets(top: 3, leading: 3, bottom: 3, trailing: 3)
        
        let itemVertical = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(0.5)
            )
        )
        
        itemVertical.contentInsets = NSDirectionalEdgeInsets(top: 3, leading: 3, bottom: 3, trailing: 3)
        
        let itemSingle = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1)
            )
        )
        
        itemSingle.contentInsets = NSDirectionalEdgeInsets(top: 3, leading: 3, bottom: 3, trailing: 3)
        
        let groupSingle = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(0.5)),
            subitem: itemSingle,
            count: 2
        )
        
        let groupVertical = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1/3),
                heightDimension: .fractionalHeight(1)),
            subitem: itemVertical,
            count: 2
        )
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(0.5)),
            subitems: [
                item,
                groupVertical,
            ]
        )
        
        let secoundGroupVertical = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(2/3)
            ),
            subitems: [
                group,
                groupSingle,
            ]
        )
        
        let section = NSCollectionLayoutSection(group: secoundGroupVertical)
        
        return UICollectionViewCompositionalLayout(section: section)
    }
}
