//
//  UserViewModel.swift
//  MVVM-UIKit-UserList-App
//
//  Created by Medikonda Anil kumar on 11/04/26.
//

import Foundation

final class UserViewModel {
    
    // MARK: - Properties
    private let userService: UserService
    private(set) var users: [User] = []
    
    // MARK: - Binding (closure)
    var onDataUpdated: (() -> Void)?
    var onError: ((String) -> Void)?
    
    // MARK: - Init
    init(userService: UserService) {
        self.userService = userService
    }
    
    // MARK: - API Call
    func fetchUsers() {
        userService.fetchUsers { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let users):
                self.users = users
                DispatchQueue.main.async {
                    self.onDataUpdated?()
                }
                
            case .failure(let error):
                DispatchQueue.main.async {
                    self.onError?(error.localizedDescription)
                }
            }
        }
    }
    
    // MARK: - Helpers
    func numberOfRows() -> Int {
        users.count
    }
    
    func user(at index: Int) -> User? {
        guard users.indices.contains(index) else { return nil }
        return users[index]
    }
}
