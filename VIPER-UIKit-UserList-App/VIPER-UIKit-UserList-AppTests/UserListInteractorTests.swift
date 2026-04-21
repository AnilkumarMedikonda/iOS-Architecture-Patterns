//
//  UserListInteractorTests.swift
//  VIPER-UIKit-UserList-AppTests
//
//  Created by Medikonda Anil kumar on 21/04/26.
//

import XCTest
@testable import VIPER_UIKit_UserList_App

final class UserListInteractorTests: XCTestCase {

    var interactor: UserListInteractor!
    var mockService: MockUserService!
    var mockOutput: MockInteractorOutput!

    override func setUp() {
        mockService = MockUserService()
        mockOutput = MockInteractorOutput()

        interactor = UserListInteractor(service: mockService)
        interactor.presenter = mockOutput
    }

    func test_success() {
        mockService.result = .success([
            User(id: 1, name: "Test", email: "t@test.com")
        ])

        interactor.fetchUsers()

        XCTAssertEqual(mockOutput.users.count, 1)
    }

    func test_failure() {
        mockService.result = .failure(.invalidURL)

        interactor.fetchUsers()
        XCTAssertNotNil(mockOutput.error)
    }
}
