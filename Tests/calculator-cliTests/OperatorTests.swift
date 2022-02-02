//
//  OperatorTests.swift
//  
//
//  Created by Juan Felipe Mendez Peralta on 1/02/22.
//

import XCTest
import class Foundation.Bundle
@testable import calculator_cli

final class OperatorTests: XCTestCase {
    func test_addition() {
        self.operatorCalculationTest(op: "+", precedence: 1, lhs: 23, rhs: 45, expectedResult: 68)
    }
    
    func test_subtraction() {
        self.operatorCalculationTest(op: "-", precedence: 0, lhs: 19, rhs: 14, expectedResult: 5)
    }
    
    func tesst_multiplication() {
        self.operatorCalculationTest(op: "*", precedence: 2, lhs: 3, rhs: 4, expectedResult: 12)
    }
    
    func test_division_whenDenominatorIsZero() {
        guard let op = Operator(rawValue: "/") else {
            XCTFail("Operator should not be nil")
            return
        }
        XCTAssertEqual(op.precedence, 3)
        XCTAssertTrue(op.calculate(lhs: 9, rhs: 0).isNaN)
    }
    
    func test_division_whenDenominatorIsNot() {
        self.operatorCalculationTest(op: "/", precedence: 3, lhs: 9, rhs: 3, expectedResult: 3)
    }
    
    func test_operatorInit_whenTokenIsAnyString() {
        let op = Operator(rawValue: "Other string")
        XCTAssertNil(op)
    }
    
    private func operatorCalculationTest(op: String, precedence: Int, lhs: Double, rhs: Double, expectedResult: Double) {
        guard let op = Operator(rawValue: op) else {
            XCTFail("Operator should not be nil")
            return
        }
        XCTAssertEqual(op.precedence, precedence)
        XCTAssertEqual(op.calculate(lhs: lhs, rhs: rhs), expectedResult)
    }
}
