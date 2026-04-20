//
//  UserServiceProtocol.swift
//  VIPER-UIKit-UserList-App
//
//  Created by Medikonda Anil kumar on 20/04/26.
//

import Foundation

protocol UserServiceProtocol {
    func fetchUsers(completion: @escaping (Result<[User], NetworkError>) -> Void)
}
