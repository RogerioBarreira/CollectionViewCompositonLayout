//
//  RMCharacterViewModel.swift
//  CollectionViewCompositionLayout
//
//  Created by Rogerio Martins on 30/04/23.
//

import Foundation

class RMCharacterViewModel: NSObject {
    
    private var rmCharacter: [Result] = []
    private let worker = Worker()
    
    var numberOfItemRMCharacter: Int {
        return rmCharacter.count
    }
    
    func cellForItensRMCharacter(indexPath: IndexPath)-> Result? {
        return rmCharacter[indexPath.item]
    }
    
    func requestRMCharacterViewModel(completion: @escaping (Bool)-> Void) {
        worker.workerRMCharacter { [weak self] myRMCharac, success in
            guard let self = self else { return }
            switch success {
            case true:
                self.rmCharacter = myRMCharac?.results ?? []
                completion(true)
            case false:
                completion(false)
            }
        }
    }
}
