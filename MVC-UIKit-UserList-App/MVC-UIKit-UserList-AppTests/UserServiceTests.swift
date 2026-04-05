//
//  UserServiceTests.swift
//  MVC-UIKit-UserList-App
//
//  Created by Medikonda Anil kumar on 05/04/26.
//

import XCTest
@testable import MVC_UIKit_UserList_App

final class UserServiceTests: XCTestCase {
    
    var userService: UserService!
    var mockNetworkManager: MockNetworkManager!
    
    override func setUp() {
        super.setUp()
        mockNetworkManager = MockNetworkManager()
        userService = UserService(networkManager: mockNetworkManager)
    }
    
    override func tearDown() {
        userService = nil
        mockNetworkManager = nil
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
        
        let expectation = expectation(description: "Users fetched successfully")
        
        // When
        userService.fetchUsers { result in
            
            // Then
            switch result {
            case .success(let users):
                XCTAssertEqual(users.count, 2)
                XCTAssertEqual(users.first?.name, "Anil")
                XCTAssertEqual(users.first?.email, "anil@test.com")
                
            case .failure:
                XCTFail("Expected success but got failure")
            }
            
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 1)
    }
    
    // MARK: - Failure Test
    func testFetchUsersFailure() {
        
        // Given
        mockNetworkManager.shouldReturnError = true
        
        let expectation = expectation(description: "Users fetch failed")
        
        // When
        userService.fetchUsers { result in
            
            // Then
            switch result {
            case .success:
                XCTFail("Expected failure but got success")
                
            case .failure(let error):
                XCTAssertNotNil(error)
            }
            
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 1)
    }
    
    // MARK: - Empty Response Test
    func testFetchUsersEmptyResponse() {
        
        // Given
        mockNetworkManager.mockUsers = []
        
        let expectation = expectation(description: "Empty users list")
        
        // When
        userService.fetchUsers { result in
            
            // Then
            switch result {
            case .success(let users):
                XCTAssertTrue(users.isEmpty)
                
            case .failure:
                XCTFail("Expected success but got failure")
            }
            
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 1)
    }
}
