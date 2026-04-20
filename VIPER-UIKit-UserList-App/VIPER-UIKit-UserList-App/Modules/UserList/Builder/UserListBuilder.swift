//
//  UserListBuilder.swift
//  VIPER-UIKit-UserList-App
//
//  Created by Medikonda Anil kumar on 20/04/26.
//

import UIKit

final class UserListBuilder {

    static func build() -> UIViewController {

        let network = NetworkManager()
        let service = UserService(network: network)

        let view = UserListViewController()
        let presenter = UserListPresenter()
        let interactor = UserListInteractor(service: service)
        let router = UserListRouter()

        view.presenter = presenter

        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router

        interactor.presenter = presenter
        router.viewController = view

        return view
    }
}
