//
//  UserService.swift
//  VIPER-UIKit-UserList-App
//
//  Created by Medikonda Anil kumar on 20/04/26.
//


import Foundation

final class UserService: UserServiceProtocol {

    private let network: NetworkManaging

    init(network: NetworkManaging) {
        self.network = network
    }

    func fetchUsers(completion: @escaping (Result<[User], NetworkError>) -> Void) {
        guard let url = APIConstants.EndPoints.users.url else {
            completion(.failure(.invalidURL))
            return
        }
        network.request(url: url, completion: completion)
    }
}
