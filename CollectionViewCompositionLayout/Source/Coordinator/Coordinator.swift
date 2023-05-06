//
//  Coordinator.swift
//  CollectionViewCompositionLayout
//
//  Created by Rogerio Martins on 30/04/23.
//

import UIKit

class Coordinator: NSObject {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController?) {
        if navigationController == nil {
            self.navigationController = UINavigationController()
        }
        self.navigationController = navigationController ?? UINavigationController()
    }
    
    func startRMCharacter() {
        let viewController = RMCharacterViewController()
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
    func startRMCharacterDetail(detail: Result) {
        let viewModel = RMCharacterDetailViewModel(rmCharacterDetail: detail)
        let viewController = RMCharacterDetailViewController(viewModelRMCharacterDetail: viewModel)
        viewController.viewModelRMCharacterDetail.getDetailRMCharacter(detail: detail)
        self.navigationController.pushViewController(viewController, animated: true)
    }
}
