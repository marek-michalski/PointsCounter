//
//  PointsCounterUITests.swift
//  PointsCounterUITests
//
//  Created by Marek Michalski on 30/05/2024.
//

import XCTest

final class PointsCounterUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        let title  = app.staticTexts["Gracze"]
        XCTAssertTrue(title.exists)
        
        let sidebarCollectionView = app.collectionViews["Sidebar"]
        let incrementButton = sidebarCollectionView/*@START_MENU_TOKEN@*/.steppers["0 pkt"].buttons["Increment"]/*[[".cells.steppers[\"0 pkt\"]",".buttons[\"0 pkt, Increment\"]",".buttons[\"Increment\"]",".steppers[\"0 pkt\"]"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/
        incrementButton.tap()
        sidebarCollectionView/*@START_MENU_TOKEN@*/.steppers["1 pkt"].buttons["Decrement"]/*[[".cells.steppers[\"1 pkt\"]",".buttons[\"1 pkt, Decrement\"]",".buttons[\"Decrement\"]",".steppers[\"1 pkt\"]"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/.tap()
        incrementButton.tap()
        
        let graczeNavigationBar = app.navigationBars["Gracze"]
        graczeNavigationBar/*@START_MENU_TOKEN@*/.buttons["Reset"]/*[[".otherElements[\"Reset\"].buttons[\"Reset\"]",".buttons[\"Reset\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        graczeNavigationBar/*@START_MENU_TOKEN@*/.buttons["Edit"]/*[[".otherElements[\"Edit\"].buttons[\"Edit\"]",".buttons[\"Edit\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        sidebarCollectionView.cells.otherElements.containing(.image, identifier:"minus.circle.fill").element.tap()
        sidebarCollectionView.buttons["Delete"].tap()
        graczeNavigationBar/*@START_MENU_TOKEN@*/.buttons["Done"]/*[[".otherElements[\"Done\"].buttons[\"Done\"]",".buttons[\"Done\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        graczeNavigationBar/*@START_MENU_TOKEN@*/.buttons["Add People/Follow"]/*[[".otherElements[\"Add People\/Follow\"].buttons[\"Add People\/Follow\"]",".buttons[\"Add People\/Follow\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let podajImiGraczaTextField = app.textFields["Podaj imię gracza..."]
        podajImiGraczaTextField.tap()
        podajImiGraczaTextField.tap()
        app.buttons["Dodaj"].tap()
        
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
