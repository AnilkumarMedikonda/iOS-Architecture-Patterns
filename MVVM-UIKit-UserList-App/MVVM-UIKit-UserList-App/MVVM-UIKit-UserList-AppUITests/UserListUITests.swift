//
//  UserListUITests.swift
//  MVVM-UIKit-UserList-AppUITests
//
//  Created by Medikonda Anil kumar on 11/04/26.
//

import UIKit
import XCTest

final class UserListUITests: XCTestCase {
    
    private var app: XCUIApplication!
    
    // MARK: - Setup
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        
        app = XCUIApplication()
        
        // Enable mock mode for stable tests
        app.launchArguments.append("UITestMode")
        
        app.launch()
    }
    
    // MARK: - Helpers
    private func waitForTable() -> XCUIElement {
        let table = app.tables["userTable"]
        XCTAssertTrue(table.waitForExistence(timeout: 3),
                      "User table should exist")
        return table
    }
    
    // MARK: - App Launch
    func testAppLaunchesSuccessfully() {
        _ = waitForTable()
    }
    
    // MARK: - TableView Exists
    func testTableViewExists() {
        let table = waitForTable()
        XCTAssertTrue(table.exists)
    }
    
    // MARK: - Cells Loaded
    func testUserCellsDisplayed() {
        let table = waitForTable()
        
        // Ensure data is loaded
        XCTAssertGreaterThan(table.cells.count, 0,
                             "Table should contain at least one cell")
        
        let firstCell = table.cells["userCell_0"]
        XCTAssertTrue(firstCell.waitForExistence(timeout: 3),
                      "First cell should be visible")
    }
    
    // MARK: - Cell Content Validation
    func testUserCellContent() {
        let table = waitForTable()
        
        let firstCell = table.cells["userCell_0"]
        XCTAssertTrue(firstCell.waitForExistence(timeout: 3))
        
        let nameLabel = firstCell.staticTexts["nameLabel_0"]
        let emailLabel = firstCell.staticTexts["emailLabel_0"]
        
        // Existence
        XCTAssertTrue(nameLabel.exists, "Name label should exist")
        XCTAssertTrue(emailLabel.exists, "Email label should exist")
        
        // Content validation
        XCTAssertTrue(nameLabel.label.contains("Name"),
                      "Name should contain 'Name'")
        XCTAssertTrue(emailLabel.label.contains("@"),
                      "Email should contain '@'")
    }
    
    // MARK: - Scroll Test
    func testTableViewScroll() {
        let table = waitForTable()
        
        let firstCell = table.cells["userCell_0"]
        XCTAssertTrue(firstCell.exists)
        
        table.swipeUp()
        table.swipeDown()
        
        // Verify UI still stable
        XCTAssertTrue(firstCell.exists)
    }
    
    // MARK: - Cell Tap Test
    func testCellTap() {
        let table = waitForTable()
        
        let firstCell = table.cells["userCell_0"]
        XCTAssertTrue(firstCell.waitForExistence(timeout: 3))
        
        firstCell.tap()
        
        XCTAssertTrue(firstCell.exists)
    }
}
