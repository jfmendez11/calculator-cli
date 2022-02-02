//
//  ExpressionTests.swift
//  
//
//  Created by Juan Felipe Mendez Peralta on 1/02/22.
//

import XCTest
import class Foundation.Bundle
@testable import calculator_cli

final class ExpressionTests: XCTestCase {
    private var sut: Expression!
    
    override func tearDown() {
        self.sut = nil
        super.tearDown()
    }
    
    func test_validExpression() {
        let expression = "1+2.55*3/4--5+-6"
        self.sut = Expression(expression: expression)
        
        XCTAssertNotNil(self.sut)
        XCTAssertEqual(self.sut.operators.count, 5)
        XCTAssertEqual(self.sut.operands.count, 6)
        XCTAssertEqual(self.sut.operators.count, self.sut.operands.count - 1)
    }
    
    func test_invalidExpression() {
        let expression = "1+2+3*/4 + 5x -.14"
        self.sut = Expression(expression: expression)
        
        XCTAssertNil(self.sut)
    }
}
