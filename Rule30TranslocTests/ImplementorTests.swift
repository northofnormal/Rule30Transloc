//
//  ImplementorTests.swift
//  Rule30TranslocTests
//
//  Created by Anne Cahalan on 1/3/22.
//

import XCTest
import Rule30Transloc

class ImplementorTests: XCTestCase {
    let testImplementor = Implementer()

    func testRule30ifyRule30sAnArrayCorrectly() {
        let maxSize = 5
        let result = testImplementor.rule30ify(maxSize)

        XCTAssertEqual(result, [[0, 0, 1, 0, 0], [0, 1, 1, 1, 0], [1, 1, 0, 0, 1], [0, 0, 1, 1, 1], [0, 1, 1, 0, 0], [1, 1, 0, 1, 0]])
    }

    func testFindMiddleReturnsASingleItemOnOddNumbers() {
        let oddNumber = 17
        let middle = testImplementor.findMiddle(oddNumber)

        XCTAssertEqual(middle?.count, 1)
    }

    func testFindMiddleReturnsThreeItemsOnEvenNumbers() {
        let evenNumber = 24
        let middle = testImplementor.findMiddle(evenNumber)

        XCTAssertEqual(middle?.count, 3)
    }

    func testTranslateHandlesTheFirstItemInAnArrayCorrectly() {
        let testArray = [0, 0, 1]
        let translatedArray = testImplementor.translate(testArray)

        XCTAssertEqual(translatedArray.first, 0)
    }

    func testTranslateHandlesTheLastItemInAnArrayCorrectly() {
        let testArray = [0, 0, 1]
        let translatedArray = testImplementor.translate(testArray)

        XCTAssertEqual(translatedArray.last, 1)
    }

    func testTranslateTranslateAnEntireArrayCorrectly() {
        let testArray = [1, 0, 0, 1]
        let translatedArray = testImplementor.translate(testArray)

        XCTAssertEqual(translatedArray, [0, 1, 1, 1])
    }

    func testDetermineValueReturns0Correctly() {
        let allOnesArray = [1,1,1]
        let oneOneZeroArray = [1,1,0]
        let oneZeroOneArray = [1,0,1]
        let allZerosArray = [0, 0, 0]

        let allOnesResult = testImplementor.determineValue(from: allOnesArray)
        XCTAssertEqual(allOnesResult, 0)

        let oneOneZeroResult = testImplementor.determineValue(from: oneOneZeroArray)
        XCTAssertEqual(oneOneZeroResult, 0)

        let oneZeroOneResult = testImplementor.determineValue(from: oneZeroOneArray)
        XCTAssertEqual(oneZeroOneResult, 0)

        let allZerosResult = testImplementor.determineValue(from: allZerosArray)
        XCTAssertEqual(allZerosResult, 0)
    }

    func testDetermineValueReturns1Correctly() {
        let oneZeroZeroArray = [1,0,0]
        let zeroOneZeroArray = [0,1,0]
        let zeroOneOneArray = [0,1,1]
        let zeroZeroOneArray = [0,0,1]

        let oneZeroZeroResult = testImplementor.determineValue(from: oneZeroZeroArray)
        XCTAssertEqual(oneZeroZeroResult, 1)

        let zeroOneZeroResult = testImplementor.determineValue(from: zeroOneZeroArray)
        XCTAssertEqual(zeroOneZeroResult, 1)

        let zeroOneOneResult = testImplementor.determineValue(from: zeroOneOneArray)
        XCTAssertEqual(zeroOneOneResult, 1)

        let zeroZeroOneResult = testImplementor.determineValue(from: zeroZeroOneArray)
        XCTAssertEqual(zeroZeroOneResult, 1)
    }

}
