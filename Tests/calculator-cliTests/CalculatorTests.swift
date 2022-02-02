//
//  CalculatorTests.swift
//  
//
//  Created by Juan Felipe Mendez Peralta on 1/02/22.
//

import XCTest
import class Foundation.Bundle
@testable import calculator_cli

final class CalculatorTests: XCTestCase {
    func test_calculatorEvaluate() {
        let expressionResultDict: [String:Double?] = [
            "1+2+3+4*5": 26,
            "--1+34-+4*12/6": 27,
            "invalid expression": nil,
            "12+345/0*45-45": .nan
        ]
        
        for (expressionInput, expectedResult) in expressionResultDict {
            if let expression = Expression(expression: expressionInput) {
                let result = Calculator.evaluate(expression: expression)
                if expectedResult?.isNaN ?? false {
                    XCTAssertTrue(result.isNaN)
                } else {
                    XCTAssertEqual(result, expectedResult)
                }
            } else {
                XCTAssertNil(expectedResult)
            }
        }
    }
}
