//
//  Worker.swift
//  CollectionViewCompositionLayout
//
//  Created by Rogerio Martins on 30/04/23.
//

import Foundation

class Worker: NSObject {
    private var rmCharacter: RMCharacter?
    private let requestService = RequestService()
    
    func workerRMCharacter(page: Int = 0, completion: @escaping (RMCharacter?,Bool)-> Void) {
        
        let basePath = ServiceBasePath.basePath
        let endPoint = EndPointType.character.rawValue
        let param = ParamType.page.rawValue
        let url = "\(basePath)\(endPoint)\(param)\(page)"
        
        requestService.requestService(urlString: url, method: .get, custom: RMCharacter.self) { [weak self] myCharc, success in
            guard let self = self else { return }
            switch success {
            case true:
                self.rmCharacter = myCharc
                completion(myCharc, true)
            case false:
                completion(nil,false)
            }
        }
    }
}
