//
//  UserListViewController.swift
//  MVVM-UIKit-UserList-App
//
//  Created by Medikonda Anil kumar on 11/04/26.
//

import UIKit

class UserListViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var userListTable: UITableView!
    private var viewModel: UserViewModel?
    private var vm: UserViewModel {
        guard let viewModel = viewModel else {
            fatalError("ViewModel must be injected")
        }
        return viewModel
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - Setup
    private func setup() {
        title = NSLocalizedString("users_title", comment: "")
        setupTableView()
        bindViewModel()
        vm.fetchUsers()
    }
    
    private func setupTableView() {
        userListTable.delegate = self
        userListTable.dataSource = self
        userListTable.accessibilityIdentifier = "userTable"
    }
    
    // MARK: - Dependency Injection
    func configure(viewModel: UserViewModel) {
        self.viewModel = viewModel
    }
    
    private func bindViewModel() {
        vm.onDataUpdated = { [weak self] in
            guard let self = self else { return }
            self.userListTable.reloadData()
        }
        
        vm.onError = { [weak self] message in
            guard let self = self else { return }
            self.showErrorMessage(message)
        }
    }
    
}

// MARK: - UITableViewDataSource
extension UserListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        vm.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell")
        ?? UITableViewCell(style: .subtitle, reuseIdentifier: "UserCell")
        
        if let user = vm.user(at: indexPath.row) {
            cell.textLabel?.text = "Name: \(user.name)"
            cell.detailTextLabel?.text = "Email: \(user.email)"
            cell.accessibilityIdentifier = "userCell_\(indexPath.row)"
            cell.textLabel?.accessibilityIdentifier = "nameLabel_\(indexPath.row)"
            cell.detailTextLabel?.accessibilityIdentifier = "emailLabel_\(indexPath.row)"
        }
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension UserListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let user = vm.user(at: indexPath.row) {
            print("Name: \(user.name)")
            print("Email: \(user.email)")
        }
    }
}

// MARK: - Error Handling
extension UserListViewController {
    private func showErrorMessage(_ message: String) {
        let alert = UIAlertController(title: "Error",
            message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
