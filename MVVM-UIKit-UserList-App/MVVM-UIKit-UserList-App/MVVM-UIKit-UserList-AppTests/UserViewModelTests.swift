//
//  UserViewModelTests.swift
//  MVVM-UIKit-UserList-AppTests
//
//  Created by Medikonda Anil kumar on 11/04/26.
//

import XCTest
@testable import MVVM_UIKit_UserList_App

final class UserViewModelTests: XCTestCase {
    
    private var viewModel: UserViewModel!
    private var mockNetworkManager: MockNetworkManager!
    private var userService: UserService!
    
    override func setUp() {
        super.setUp()
        
        mockNetworkManager = MockNetworkManager()
        userService = UserService(networkManager: mockNetworkManager)
        viewModel = UserViewModel(userService: userService)
    }
    
    override func tearDown() {
        viewModel = nil
        mockNetworkManager = nil
        userService = nil
        super.tearDown()
    }
    
    // MARK: - Success Test
    func testFetchUsersSuccess() {
        
        // Given
        let mockUsers = [
            User(id: 1, name: "Anil", email: "anil@test.com"),
            User(id: 2, name: "Kumar", email: "kumar@test.com")
        ]
        mockNetworkManager.mockUsers = mockUsers
        
        let expectation = expectation(description: "Data Updated")
        
        viewModel.onDataUpdated = {
            expectation.fulfill()
        }
        
        // When
        viewModel.fetchUsers()
        
        // Then
        waitForExpectations(timeout: 1)
        XCTAssertEqual(viewModel.numberOfRows(), 2)
    }
    
    // MARK: - Failure Test
    func testFetchUsersFailure() {
        
        // Given
        mockNetworkManager.shouldReturnError = true
        
        let expectation = expectation(description: "Error Triggered")
        
        viewModel.onError = { message in
            XCTAssertFalse(message.isEmpty)
            expectation.fulfill()
        }
        
        // When
        viewModel.fetchUsers()
        
        // Then
        waitForExpectations(timeout: 1)
    }
    
    // MARK: - numberOfRows Test
    func testNumberOfRows() {
        
        // Given
        mockNetworkManager.mockUsers = [
            User(id: 1, name: "Anil", email: "test@test.com")
        ]
        
        let expectation = expectation(description: "Data Loaded")
        
        viewModel.onDataUpdated = {
            expectation.fulfill()
        }
        
        // When
        viewModel.fetchUsers()
        
        // Then
        waitForExpectations(timeout: 1)
        XCTAssertEqual(viewModel.numberOfRows(), 1)
    }
    
    // MARK: - user(at:) Test
    func testUserAtIndex() {
        
        // Given
        let users = [
            User(id: 1, name: "Anil", email: "test@test.com")
        ]
        mockNetworkManager.mockUsers = users
        
        let expectation = expectation(description: "Data Loaded")
        
        viewModel.onDataUpdated = {
            expectation.fulfill()
        }
        
        // When
        viewModel.fetchUsers()
        waitForExpectations(timeout: 1)
        
        // Then
        let user = viewModel.user(at: 0)
        XCTAssertEqual(user?.name, "Anil")
    }
}
