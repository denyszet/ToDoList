//
//  ScreensElements.swift
//  ToDoListUITests
//
//  Created by Valentina Socolov on 31/07/2022.
//  Copyright © 2022 Radu Ursache - RanduSoft. All rights reserved.
//

import XCTest
class ToDoListElements {
	// Group screen element and attached relevant element type thus in case of any changed/issues it is easier and faster to detect and update label
	enum ScreensElements: String {
		case welcom = "Welcome to ToDoList"
		case continueButton = "Continue"
		case pushNotification = "Push Notifications"
		case notNowButton = "Not now"
		case onBoardingDone = "Onboarding done"
		case getStartedButton = "Get started"
		case toDoListHome = "ToDoList.HomeView"
		case addTaskButton = "Add Task"
		case saveButton = "Save"
		case allTasksButton = "All Tasks"
		case editButton = "Edit"
		case completeTaskButton = "complete task icon"
		case noTasks = "No tasks"
		
		var element:XCUIElement {
			switch self {
			case .welcom, .pushNotification, .onBoardingDone, .toDoListHome, .noTasks:
				return XCUIApplication().staticTexts[self.rawValue]
			case .continueButton, .notNowButton, .getStartedButton, .addTaskButton, .saveButton, .allTasksButton, .editButton, .completeTaskButton:
				return XCUIApplication().buttons[self.rawValue]
			}
		}
	}
	
	enum taskName:String {
		case addTask = "To write a test"
		case editTask = "  and to run a test"
	}
	func enter(taskName: taskName) {
		switch taskName {
		case .addTask:
			ToDoListElements.ScreensElements.addTaskButton.element.tap()
			XCUIApplication().textViews.element.typeText(taskName.rawValue)
			ToDoListElements.ScreensElements.saveButton.element.tap()
		case .editTask:
			XCUIApplication().cells.element(boundBy: 0).tap()
			XCUIApplication().cells.element(boundBy: 0).tap()
			ToDoListElements.ScreensElements.editButton.element.tap()
			XCUIApplication().textViews.element.typeText(taskName.rawValue)
			ToDoListElements.ScreensElements.saveButton.element.tap()
		}
	}
	func enterTaskName(_ name: ToDoListElements.taskName) {
		enter(taskName: name)
	}
	
	// Confirm if task was created by matching All Tasks with updated value 1
	func createdTask() {
		XCUIApplication().cells
			.descendants(matching: .staticText).matching(NSPredicate(format: "label = '1'", "All Tasks"))
			.element(boundBy: 0)
			.exists
	}
}
