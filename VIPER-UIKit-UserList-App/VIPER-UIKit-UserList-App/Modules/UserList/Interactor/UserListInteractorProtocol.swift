//
//  UserListInteractorProtocol.swift
//  VIPER-UIKit-UserList-App
//
//  Created by Medikonda Anil kumar on 20/04/26.
//

import Foundation

protocol UserListInteractorProtocol {
    func fetchUsers()
}

protocol UserListInteractorOutputProtocol: AnyObject {
    func didFetchUsers(_ users: [User])
    func didFail(_ error: NetworkError)
}
