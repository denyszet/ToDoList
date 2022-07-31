//
//  ToDoListUITests.swift
//  ToDoListUITests
//
//  Created by Valentina Socolov on 31/07/2022.
//  Copyright © 2022 Radu Ursache - RanduSoft. All rights reserved.
//

import XCTest

class ToDoListUITests: XCTestCase {
	
	override func setUpWithError() throws {
		super .setUp()
		continueAfterFailure = false
		let app = XCUIApplication()
		app.launch()
		
	}
	
	override func tearDownWithError() throws {
		super .tearDown()
	}
	
	func waitForElement(_ element:XCUIElement) {
		let isElementExists = element.waitForExistence(timeout: 3)
		if isElementExists {
			XCTAssertTrue(element.exists)
		}
	}
}
