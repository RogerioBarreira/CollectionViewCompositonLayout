//
//  ViewController.swift
//  CollectionViewCompositionLayout
//
//  Created by Rogerio Martins on 30/04/23.
//

import UIKit

class RMCharacterViewController: UIViewController {
    
    lazy var viewRMCharacter: RMCharacterView = {
        let view = RMCharacterView()
        view.backgroundColor = .systemBackground
        return view
    }()
    
    let viewModelRMCharacter = RMCharacterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "RMCharaterList"
        setupCollectionView()
        setupRequest()
    }
    
    func setupCollectionView() {
        viewRMCharacter.myCollectionView.delegate = self
        viewRMCharacter.myCollectionView.dataSource = self
        viewRMCharacter.myCollectionView.register(RMCharacterCollectionViewCell.self, forCellWithReuseIdentifier: RMCharacterCollectionViewCell.identifier)
    }
    
    func setupRequest() {
        viewRMCharacter.loading.startAnimating()
        viewModelRMCharacter.requestRMCharacterViewModel { [weak self] success in
            guard let self = self else { return }
            self.viewRMCharacter.loading.stopAnimating()
            switch success {
            case true:
                self.viewRMCharacter.myCollectionView.reloadData()
            case false:
                print("Request Fail")
            }
        }
    }
    
    override func loadView() {
        self.view = viewRMCharacter
    }
}

extension RMCharacterViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModelRMCharacter.numberOfItemRMCharacter
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = viewRMCharacter.myCollectionView.dequeueReusableCell(withReuseIdentifier: RMCharacterCollectionViewCell.identifier, for: indexPath) as? RMCharacterCollectionViewCell {
            cell.setupCell(image: viewModelRMCharacter.cellForItensRMCharacter(indexPath: indexPath))
            return cell
        }
        return UICollectionViewCell()
    }
}

