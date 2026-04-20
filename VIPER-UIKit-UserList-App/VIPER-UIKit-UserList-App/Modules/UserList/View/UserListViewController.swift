//
//  UserListViewController.swift
//  VIPER-UIKit-UserList-App
//
//  Created by Medikonda Anil kumar on 20/04/26.
//


import UIKit

final class UserListViewController: UIViewController {

    var presenter: UserListPresenterProtocol!

    private let tableView = UITableView()
    private let loader = UIActivityIndicatorView(style: .large)

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Users"
        setupUI()
        presenter.viewDidLoad()
    }

    private func setupUI() {
        view.backgroundColor = .white

        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)

        loader.center = view.center
        view.addSubview(loader)
    }
}

extension UserListViewController: UserListViewProtocol {

    func showLoading() { loader.startAnimating() }
    func hideLoading() { loader.stopAnimating() }
    func reloadData() { tableView.reloadData() }

    func showError(_ message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}

extension UserListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.numberOfRows()
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        let user = presenter.user(at: indexPath.row)
        cell.textLabel?.text = user.name
        cell.detailTextLabel?.text = user.email
        return cell
    }
}

extension UserListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectRow(at: indexPath.row)
    }
}
