//
//  ToDoListTests.swift
//  ToDoListUITests
//
//  Created by Valentina Socolov on 31/07/2022.
//  Copyright © 2022 Radu Ursache - RanduSoft. All rights reserved.
//

import XCTest

class ToDoListTests: ToDoListSteps {
	
	func test_userAddTask() {
		userPassOnBoarding()
		userAddTask()
		userEditTask()
		usedDeleteTask()
	}
}
