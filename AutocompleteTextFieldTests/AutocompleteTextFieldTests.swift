//
//  AutocompleteTextFieldTests.swift
//  AutocompleteTextFieldTests
//
//  Created by Roman Panichkin on 4/21/18.
//  Copyright © 2018 Roman Panichkin. All rights reserved.
//

import XCTest
@testable import AutocompleteTextField

class AutocompleteTextFieldTests: XCTestCase {
    
    let textField = AutocompleteTextField(frame: .zero, suggestions: nbaTeamsSuggestions)

    override func tearDown() {
        textField.text = ""
        
        super.tearDown()
    }
    
    func setTextFieldInput(_ input: String) {
        textField.text = input
        textField.sendActions(for: .editingChanged)
    }
    
    // Text is equal to one of suggestions first part prefix"
    func testSuccessfullAutocomplete() {
        setTextFieldInput("Chi")
        
        XCTAssertEqual(textField.suggestion, "Chicago Bulls")
    }
    
    // Test matching suggestion with min length. For input "New " expect "New York Knicks" over "New Orleans Pelicans"
    func testShortestSuggestion() {
        setTextFieldInput("New ")
        
        XCTAssertEqual(textField.suggestion, "New York Knicks")
    }
    
    // No matching suggestion
    func testNoMatchingSuggestion() {
        setTextFieldInput("Mock input")
        
        XCTAssertEqual(textField.suggestion, nil)
        XCTAssertEqual(textField.text, "Mock input")
    }
    
    // Empty input
    func testEmptyInput() {
        setTextFieldInput(" ")
        
        XCTAssertEqual(textField.suggestion, nil)
        XCTAssertEqual(textField.text, " ")
    }
    
    // User presses "return" button to perform autocomplete
    func testPerformingCompletion() {
        setTextFieldInput("Chi")
        _ = textField.textFieldShouldReturn(textField)
        
        XCTAssertEqual(textField.text, "Chicago Bulls")
    }
}
