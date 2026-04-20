//
//  UserListRouter.swift
//  VIPER-UIKit-UserList-App
//
//  Created by Medikonda Anil kumar on 20/04/26.
//

import UIKit

final class UserListRouter {

    weak var viewController: UIViewController?

    func navigateToDetail(user: User) {
        let vc = UIViewController()
        vc.view.backgroundColor = .white
        vc.title = user.name
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
