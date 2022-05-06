//
//  ToDoListUITests.swift
//  ToDoListUITests
//
//  Created by Darinka on 06.05.2022.
//  Copyright © 2022 Radu Ursache - RanduSoft. All rights reserved.
//

import XCTest

class ToDoListUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launch()
        sleep(1)
    }
    
    func testAddTask() throws {
        //given
        goToTasksView()
        let numberOfTasksBeforeAdd = checkNumbersOfTasks()
        goBack()
               
        // when
        app.buttons["Add Task"].tap()
        app.textViews.element.tap()
        app.textViews.element.typeText("New task 🦊")
        app.buttons["Save"].tap()
                
        // then
        goToTasksView()
        let numberOfTasksAfterAdd = checkNumbersOfTasks()
        XCTAssertEqual(numberOfTasksAfterAdd, numberOfTasksBeforeAdd + 1)
    }
    
    func testEditTask() throws {
        //given
        createNewTask()
        goToTasksView()
               
        // when
        getFirstCell().tap()
        app.sheets["Task options"].buttons["Edit"].tap()
        sleep(2)
        app.textViews.element.tap()
        app.keys["delete"].press(forDuration: 5.0)
        app.textViews.element.typeText("Edited task 🤪")
        app.buttons["Save"].tap()
        sleep(2)
                
        // then
        let editedText = getFirstCell().staticTexts["taskTitle"].label
        XCTAssertEqual(editedText, "Edited task 🤪")
    }
    
    func testDeleteTask() throws {
        //given
        createNewTask()
        goToTasksView()
        let numberOfTasksBeforeDelete = checkNumbersOfTasks()
        let tasksTableView = app.tables.matching(identifier: "tasksTableView")
        let firstCell = tasksTableView.cells.element(boundBy: 0)
               
        // when
        firstCell.swipeLeft()
        firstCell.buttons["Delete"].tap()
        sleep(2)
                
        // then
        let numberOfTasksAfterDelete = checkNumbersOfTasks()
        XCTAssertEqual(numberOfTasksAfterDelete, numberOfTasksBeforeDelete - 1)
    }
}

extension ToDoListUITests {

    func createNewTask() {
        app.buttons["Add Task"].tap()
        app.textFields.element(boundBy: 0).typeText("New task 🐰")
        app.buttons["Save"].tap()
    }
    
    func goToTasksView() {
        let homeTableView = app.tables.matching(identifier: "homeTableView")
        homeTableView.cells.staticTexts["All Tasks"].tap()
    }
    
    func getFirstCell() -> XCUIElement {
        let tasksTableView = app.tables.matching(identifier: "tasksTableView")
        let firstCell = tasksTableView.cells.element(boundBy: 0)
        return firstCell
    }
    
    func checkNumbersOfTasks() -> Int {
        let tasksTableView = app.tables.matching(identifier: "tasksTableView")
        let numberOfTasks = tasksTableView.cells.count
        return numberOfTasks
    }
    
    func goBack() {
        let backButton = app.navigationBars["All Tasks"].buttons["Back"]
        backButton.tap()
    }
}
