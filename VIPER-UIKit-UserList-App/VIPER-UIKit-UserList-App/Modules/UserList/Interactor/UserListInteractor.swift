//
//  UserListInteractor.swift
//  VIPER-UIKit-UserList-App
//
//  Created by Medikonda Anil kumar on 20/04/26.
//

import Foundation


final class UserListInteractor: UserListInteractorProtocol {

    weak var presenter: UserListInteractorOutputProtocol?
    private let service: UserServiceProtocol

    init(service: UserServiceProtocol) {
        self.service = service
    }

    func fetchUsers() {
        service.fetchUsers { [weak self] result in
            switch result {
            case .success(let users):
                self?.presenter?.didFetchUsers(users)
            case .failure(let error):
                self?.presenter?.didFail(error)
            }
        }
    }
}
