//
//  MockUserService.swift
//  VIPER-UIKit-UserList-AppTests
//
//  Created by Medikonda Anil kumar on 21/04/26.
//

import  XCTest

@testable import VIPER_UIKit_UserList_App

final class MockUserService: UserServiceProtocol {
    var result: Result<[User], NetworkError>!

    func fetchUsers(completion: @escaping (Result<[User], NetworkError>) -> Void) {
        completion(result)
    }
}

final class MockInteractorOutput: UserListInteractorOutputProtocol {
    var users: [User] = []
    var error: NetworkError?

    func didFetchUsers(_ users: [User]) {
        self.users = users
    }

    func didFail(_ error: NetworkError) {
        self.error = error
    }
}

final class MockView: UserListViewProtocol {
    var reloadCalled = false
    var errorShown = false
    var loadingShown = false
    var loadingHidden = false

    func reloadData() { reloadCalled = true }
    func showError(_ message: String) { errorShown = true }
    func showLoading() { loadingShown = true }
    func hideLoading() { loadingHidden = true }
}

final class MockInteractor: UserListInteractorProtocol {
    var fetchCalled = false
    func fetchUsers() { fetchCalled = true }
}
