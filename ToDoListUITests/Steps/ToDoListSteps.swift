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
	
	//MARK: User pass onBoarding
	//  Given: User Launch app for the fisr time
	//	When: User pass onBoarding
	//	Then: User Land on ToDoList Main Page
	func userPassOnBoarding() {
		XCTContext.runActivity(named: "Given: User launch app for the first time") { _ in
			waitForElement(ToDoListElements.ScreensElements.welcom.element)
		}
		XCTContext.runActivity(named: "When user pass onBoarding") { _ in
			ToDoListElements.ScreensElements.continueButton.element.tap()
			waitForElement(ToDoListElements.ScreensElements.pushNotification.element)
			ToDoListElements.ScreensElements.notNowButton.element.tap()
			waitForElement(ToDoListElements.ScreensElements.onBoardingDone.element)
			ToDoListElements.ScreensElements.getStartedButton.element.tap()
		}
		XCTContext.runActivity(named: "Then user see ToDOList Main Page") { _ in
			waitForElement(ToDoListElements.ScreensElements.toDoListHome.element)
		}
	}
	
	//MARK: User add,edit and mark as done first task
//Given: User passed onBoarding
//When: user add first task
//And: task can be editable
//Then: task marked as complete
	func userAddTask() {
		XCTContext.runActivity(named: "When: user add first task") { _ in
			screenElements.enterTaskName(.addTask)
			screenElements.createdTask()
		}
	}
	func userEditTask() {
		XCTContext.runActivity(named: "And: task can be editable") { _ in
			screenElements.enterTaskName(.editTask)
		}
	}
	func usedDeleteTask() {
		XCTContext.runActivity(named: "Then: task can be deleted") { _ in
			ToDoListElements.ScreensElements.completeTaskButton.element.tap()
			waitForElement(ToDoListElements.ScreensElements.noTasks.element)
		}
	}
}
