//
//  UserService.swift
//  VIPER-UIKit-UserList-App
//
//  Created by Medikonda Anil kumar on 20/04/26.
//


import Foundation

class UserService {
    
    private let networkManager: NetworkManaging
    
    init(networkManager: NetworkManaging) {
        self.networkManager = networkManager
    }
    
    func fetchUsers(completion: @escaping (Result<[User], NetworkError>) -> Void) {
        
        guard let url = APIConstants.EndPoints.users.url else {
            completion(.failure(.invalidURL))
            return
        }
        networkManager.request(url: url, completion: completion)
    }
}
