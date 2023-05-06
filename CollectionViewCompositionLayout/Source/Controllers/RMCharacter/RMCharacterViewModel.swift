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
    var currentPage = 1
    var totalCharacter = 0
    var loadingRequest = false
    
    var newRMCharacter: [Result] {
        return rmCharacter
    }
    
    var numberOfItemRMCharacter: Int {
        return rmCharacter.count
    }
    
    func addPage() {
        currentPage = currentPage + 1
    }
    
    func cellForItensRMCharacter(indexPath: IndexPath)-> Result {
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
    
    func requestAddRMCharacterViewModel(completion: @escaping (Bool)-> Void) {
        loadingRequest = true
        worker.workerRMCharacter(page: currentPage) { [weak self] newChar, success in
            guard let self = self else { return }
            if success {
                if let char = newChar {
                    self.rmCharacter.append(contentsOf: char.results ?? [])
                    self.totalCharacter = char.info?.count ?? 0
                }
                completion(true)
            } else {
                completion(false)
            }
        }
    }
}
