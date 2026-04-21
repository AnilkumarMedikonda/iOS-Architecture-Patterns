//
//  UserListPresenterTests.swift
//  VIPER-UIKit-UserList-AppTests
//
//  Created by Medikonda Anil kumar on 21/04/26.
//

import XCTest
@testable import VIPER_UIKit_UserList_App

final class UserListPresenterTests: XCTestCase {

    var presenter: UserListPresenter!
    var mockView: MockView!
    var mockInteractor: MockInteractor!

    override func setUp() {
        presenter = UserListPresenter()
        mockView = MockView()
        mockInteractor = MockInteractor()

        presenter.view = mockView
        presenter.interactor = mockInteractor
    }

    func test_viewDidLoad() {
        presenter.viewDidLoad()

        XCTAssertTrue(mockInteractor.fetchCalled)
        XCTAssertTrue(mockView.loadingShown)
    }
}
