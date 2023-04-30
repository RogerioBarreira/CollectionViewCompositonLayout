//
//  RMCharacterViewModel.swift
//  CollectionViewCompositionLayout
//
//  Created by Rogerio Martins on 30/04/23.
//

import Foundation

class RMCharacterViewModel: NSObject {
    
    private var rmCharacter: RMCharacter?
    private let worker = Worker()
    
    func requestRMCharacterViewModel(completion: @escaping (Bool)-> Void) {
        worker.workerRMCharacter { [weak self] myRMCharac, success in
            guard let self = self else { return }
            switch success {
            case true:
                self.rmCharacter = myRMCharac
                completion(true)
            case false:
                completion(false)
            }
        }
    }
}
