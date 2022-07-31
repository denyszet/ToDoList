//
//  ToDoListSteps.swift
//  ToDoListUITests
//
//  Created by Valentina Socolov on 31/07/2022.
//  Copyright © 2022 Radu Ursache - RanduSoft. All rights reserved.
//

import XCTest

class ToDoListSteps: ToDoListUITests {
	private let screenElements = ToDoListElements()
	
	//MARK: Tests steps
	
	func userPassOnBoarding() {
		XCTContext.runActivity(named: "Given: User pass onBoarding") { _ in
			waitForElement(ToDoListElements.ScreensElements.welcom.element)
			ToDoListElements.ScreensElements.continueButton.element.tap()
			waitForElement(ToDoListElements.ScreensElements.pushNotification.element)
			ToDoListElements.ScreensElements.notNowButton.element.tap()
			waitForElement(ToDoListElements.ScreensElements.onBoardingDone.element)
			ToDoListElements.ScreensElements.getStartedButton.element.tap()
			waitForElement(ToDoListElements.ScreensElements.toDoListHome.element)
		}
	}
	func userAddTask() {
		XCTContext.runActivity(named: "When: user add task") { _ in
			screenElements.enterTaskName(.addTask)
			screenElements.createdTask()
		}
	}
	func userEditTask() {
		XCTContext.runActivity(named: "Then: User can edit task") { _ in
			screenElements.enterTaskName(.editTask)
		}
	}
	func usedDeleteTask() {
		XCTContext.runActivity(named: "And: User can delete task") { _ in
			ToDoListElements.ScreensElements.completeTaskButton.element.tap()
			waitForElement(ToDoListElements.ScreensElements.noTasks.element)
		}
	}
}
