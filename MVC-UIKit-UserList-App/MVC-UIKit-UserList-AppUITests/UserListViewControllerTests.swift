//
//  UserListViewControllerTests.swift
//  MVC-UIKit-UserList-AppUITests
//
//  Created by Medikonda Anil kumar on 06/04/26.
//

import UIKit
import XCTest
@testable import MVC_UIKit_UserList_App

final class UserListViewControllerTests: XCTestCase {
    
    var vc: UserListViewController!
    var mockService: UserService!
    var mockNetworkManager: MockNetworkManager!
    
    override func setUp() {
        super.setUp()
        
        let bundle = Bundle(for: UserListViewController.self)
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        
        vc = storyboard.instantiateViewController(
            withIdentifier: "UserListViewController"
        ) as? UserListViewController
        
        mockNetworkManager = MockNetworkManager()
        mockService = UserService(networkManager: mockNetworkManager)
        
        vc.configure(userService: mockService)
    }
    
    // MARK: - TableView Connection
    func testTableViewIsConnected() {
        vc.loadViewIfNeeded()
        XCTAssertNotNil(vc.userListTable)
    }
    
    // MARK: - Number of Rows
    func testNumberOfRows() {
        
        // Given
        mockNetworkManager.mockUsers = [
            User(id: 1, name: "Anil", email: "anil@test.com"),
            User(id: 2, name: "Kumar", email: "kumar@test.com")
        ]
        
        // When
        vc.loadViewIfNeeded() // ✅ AFTER data
        
        // Then
        let rows = vc.userListTable.numberOfRows(inSection: 0)
        XCTAssertEqual(rows, 2)
    }
    
    // MARK: - Cell Configuration
    func testCellConfiguration() {
        
        // Given
        mockNetworkManager.mockUsers = [
            User(id: 1, name: "Anil", email: "anil@test.com")
        ]
        
        // When
        vc.loadViewIfNeeded()
        
        let cell = vc.userListTable.dataSource?.tableView(
            vc.userListTable,
            cellForRowAt: IndexPath(row: 0, section: 0)
        )
        
        // Then
        XCTAssertEqual(cell?.textLabel?.text, "Name: Anil")
        XCTAssertEqual(cell?.detailTextLabel?.text, "Email: anil@test.com")
    }
}
