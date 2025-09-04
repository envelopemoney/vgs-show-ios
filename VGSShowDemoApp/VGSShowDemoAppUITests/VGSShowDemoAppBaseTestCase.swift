//
//  VGSShowDemoAppBaseTestCase.swift
//  VGSShowDemoAppUITests
//

import Foundation
import XCTest

class VGSShowDemoAppBaseTestCase: XCTestCase {

	var app: XCUIApplication!

	override func setUp() {
		super.setUp()

		continueAfterFailure = false
        
        let createdApp: XCUIApplication = MainActor.assumeIsolated {
                    let app = XCUIApplication()
                    app.launchArguments.append("VGSDemoAppUITests")
                    app.launch()
                    return app
                }
        app = createdApp
	}

	override func tearDown() {
		super.tearDown()
	}

	enum TabBar {
		/// Show tab bar button.
		static let show: VGSUITestElement = .init(type: .button, identifier: "VGSShowDemoApp.TabBar.TabButton.Show")

		/// Collect tab bar button.
		static let collect: VGSUITestElement = .init(type: .button, identifier: "VGSShowDemoApp.TabBar.TabButton.Collect")
	}

	/// Demo app use cases.
	enum UseCases {
		/// Show card data use case flow cell.
		static let showCardData = "Show Collected Card Data"

		/// Show pdf use case flow cell.
		static let showPDF = "Show Collected PDF"
        
        /// Show image use case flow cell.
        static let showImage = "Show Collected Image"
	}

	/// Navigate to Card Data use case.
    @MainActor
	func navigateToCardDataUseCase() {
		app.tables.staticTexts[UseCases.showCardData].tap()
	}

	/// Navigate to PDF use case.
    @MainActor
	func navigateToPDFUseCase() {
		app.tables.staticTexts[UseCases.showPDF].tap()
	}

    /// Navigate to Image use case.
    @MainActor
    func navigateToImageUseCase() {
        app.tables.staticTexts[UseCases.showImage].tap()
    }

	/// Start app and navigate to specific tab.
    @MainActor
	func navigateToTab(identifier tabAccessebilityIdentifier: String) {
        app.buttons[tabAccessebilityIdentifier].tap()
	}

	/// Select collect tab.
    @MainActor
	func navigateToCollectScreen() {
        // Before switching to collect screen we have only one `Collect` button in tab bar view hierarchy.
        navigateToTab(identifier: "Collect")
	}

	/// Select show tab.
    @MainActor
	func navigateToShowScreen() {
        navigateToTab(identifier: "Show")
	}
}
