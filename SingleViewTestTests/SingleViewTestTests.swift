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

    func testCalculateFizzBuzzJazz() {
        let normal = sut.calculateFizzBuzzJazz(for: 1)
        XCTAssertEqual(normal, "1")

        let fizz = sut.calculateFizzBuzzJazz(for: 3)
        XCTAssertEqual(fizz, "Fizz")

        let buzz = sut.calculateFizzBuzzJazz(for: 5)
        XCTAssertEqual(buzz, "Buzz")

        let jazz = sut.calculateFizzBuzzJazz(for: 7)
        XCTAssertEqual(jazz, "Jazz")

        let fizzBuzz = sut.calculateFizzBuzzJazz(for: 15)
        XCTAssertEqual(fizzBuzz, "FizzBuzz")

        let fizzJazz = sut.calculateFizzBuzzJazz(for: 21)
        XCTAssertEqual(fizzJazz, "FizzJazz")

        let buzzJazz = sut.calculateFizzBuzzJazz(for: 35)
        XCTAssertEqual(buzzJazz, "BuzzJazz")

        let fizzBuzzJazz = sut.calculateFizzBuzzJazz(for: 105)
        XCTAssertEqual(fizzBuzzJazz, "FizzBuzzJazz")
    }

    func testCalculateFizzBuzzJazzNumbers() {
        let result = sut.calculateFizzBuzzJazzNumbers(for: 3)
        XCTAssertEqual(result.count, 3)

        XCTAssertEqual(result.first, "1")

        XCTAssertEqual(result.last, "Fizz")
    }

    func testTryToCalulateNumbers() {
        XCTAssertTrue(sut.tryToCalulateNumbers(with: "0").isEmpty)
        XCTAssertTrue(sut.tryToCalulateNumbers(with: "abc").isEmpty)
        XCTAssertFalse(sut.tryToCalulateNumbers(with: "3").isEmpty)
    }

    func testFormatNumbers() {
        let result = sut.calculateFizzBuzzJazzNumbers(for: 3)
        let format = sut.formatNumbers(numbers: result)
        XCTAssertEqual(format, "1, \n2, \nFizz")
    }
}
