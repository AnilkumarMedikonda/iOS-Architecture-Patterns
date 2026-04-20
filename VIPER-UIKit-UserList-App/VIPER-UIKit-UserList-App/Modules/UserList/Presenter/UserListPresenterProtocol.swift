//
//  UserListPresenterProtocol.swift
//  VIPER-UIKit-UserList-App
//
//  Created by Medikonda Anil kumar on 20/04/26.
//

import Foundation

protocol UserListPresenterProtocol {
    func viewDidLoad()
    func numberOfRows() -> Int
    func user(at index: Int) -> User
    func didSelectRow(at index: Int)
}

protocol UserListViewProtocol: AnyObject {
    func reloadData()
    func showError(_ message: String)
    func showLoading()
    func hideLoading()
}
