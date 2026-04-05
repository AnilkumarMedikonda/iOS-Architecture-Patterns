//
//  UserListViewController.swift
//  MVC-UIKit-UserList-App
//
//  Created by Medikonda Anil kumar on 05/04/26.
//

import UIKit

import UIKit

class UserListViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var userListTable: UITableView!
    
    // MARK: - Properties
    private var userService: UserService!   // Injected
    private var users: [User] = []
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = NSLocalizedString("users_title", comment: "")
        
        setupTableView()
        fetchUsers()
    }
    
    // MARK: - Setup
    private func setupTableView() {
        userListTable.delegate = self
        userListTable.dataSource = self
    }
    
    // MARK: - Dependency Injection
    func configure(userService: UserService) {
        self.userService = userService
    }
    
    // MARK: - API Call
    private func fetchUsers() {
        userService.fetchUsers { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let users):
                self.users = users
                self.userListTable.reloadData()
                
            case .failure(let error):
                self.showError(error)
            }
        }
    }
}

// MARK: - UITableViewDataSource
extension UserListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell")
            ?? UITableViewCell(style: .subtitle, reuseIdentifier: "UserCell")
        
        let user = users[indexPath.row]
        cell.textLabel?.text = "Name: \(user.name)"
        cell.detailTextLabel?.text = "Email: \(user.email)"
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension UserListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let user = users[indexPath.row]
         print("Name: \(user.name)")
         print("Email: \(user.email)")
    }
}

// MARK: - Error Handling
extension UserListViewController {
    
    private func showError(_ error: NetworkError) {
        let alert = UIAlertController(
            title: "Error",
            message: error.localizedDescription,
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
