//
//  SingleViewTestTests.swift
//  SingleViewTestTests
//
//  Created by Arturo on 6/17/21.
//

import XCTest
@testable import SingleViewTest

class SingleViewTestTests: XCTestCase {
    var sut: HomeViewModel!

    override func setUp() {
        sut = HomeViewModel()
    }

    override func tearDown() {
        sut = nil
    }

    func testTryToCalculateNumbers() {
        let emptyResult = sut.tryToCalulateNumbers(with: "")
        XCTAssertNil(emptyResult)

        let zeroResult = sut.tryToCalulateNumbers(with: "0")
        XCTAssertNil(zeroResult)

        let invalidResult = sut.tryToCalulateNumbers(with: "abc")
        XCTAssertNil(invalidResult)
    }

    func testValidateNumberMultipleOf() {
        XCTAssertTrue(sut.validateNumberIsMultipleOf(number: 3, numberToValidate: 3))

        XCTAssertTrue(sut.validateNumberIsMultipleOf(number: 5, numberToValidate: 5))

        XCTAssertTrue(sut.validateNumberIsMultipleOf(number: 7, numberToValidate: 7))

        XCTAssertFalse(sut.validateNumberIsMultipleOf(number: 2, numberToValidate: 5))

        XCTAssertFalse(sut.validateNumberIsMultipleOf(number: 13, numberToValidate: 3))

        XCTAssertFalse(sut.validateNumberIsMultipleOf(number: 13, numberToValidate: 5))

        XCTAssertFalse(sut.validateNumberIsMultipleOf(number: 13, numberToValidate: 7))
    }

    func testCalculateNumbers() {
        let response = sut.calculateNumbers(with: 21)
        XCTAssertEqual(response.count, 21)

        XCTAssertEqual(response[0].titleString, "1")
        XCTAssertEqual(response[2].titleString, "Fizz")
        XCTAssertEqual(response[4].titleString, "Buzz")
        XCTAssertEqual(response[6].titleString, "Jazz")
        XCTAssertEqual(response[14].titleString, "FizzBuzz")
    }
}
