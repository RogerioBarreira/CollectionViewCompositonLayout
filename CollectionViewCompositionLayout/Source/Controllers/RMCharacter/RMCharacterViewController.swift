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
        setupRequest()
    }
    
    func setupRequest() {
        viewModelRMCharacter.requestRMCharacterViewModel { success in
            switch success {
            case true:
                print("Request OK")
            case false:
                print("Request Fail")
            }
        }
    }
    
    override func loadView() {
        self.view = viewRMCharacter
    }
}

