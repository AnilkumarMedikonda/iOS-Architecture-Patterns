//
//  MVVM_UIKit_UserList_AppUITestsLaunchTests.swift
//  MVVM-UIKit-UserList-AppUITests
//
//  Created by Medikonda Anil kumar on 11/04/26.
//

import XCTest

final class MVVM_UIKit_UserList_AppUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    @MainActor
    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
