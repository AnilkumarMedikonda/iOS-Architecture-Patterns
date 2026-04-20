//
//  UserListPresenter.swift
//  VIPER-UIKit-UserList-App
//
//  Created by Medikonda Anil kumar on 20/04/26.
//

import Foundation

final class UserListPresenter: UserListPresenterProtocol {

    weak var view: UserListViewProtocol?
    var interactor: UserListInteractorProtocol?
    var router: UserListRouter?

    private var users: [User] = []

    func viewDidLoad() {
        view?.showLoading()
        interactor?.fetchUsers()
    }

    func numberOfRows() -> Int { users.count }

    func user(at index: Int) -> User { users[index] }

    func didSelectRow(at index: Int) {
        router?.navigateToDetail(user: users[index])
    }
}

extension UserListPresenter: UserListInteractorOutputProtocol {

    func didFetchUsers(_ users: [User]) {
        self.users = users
        DispatchQueue.main.async {
            self.view?.hideLoading()
            self.view?.reloadData()
        }
    }

    func didFail(_ error: NetworkError) {
        DispatchQueue.main.async {
            self.view?.hideLoading()
            self.view?.showError("Failed to load users")
        }
    }
}
