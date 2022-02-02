//
//  Calculator.swift
//  
//
//  Created by Juan Felipe Mendez Peralta on 1/02/22.
//

import Foundation

final class Calculator {
    static func evaluate(expression: Expression) -> Double {
        var operators = expression.operators
        var operands = expression.operands
        
        var i = 0
        while !operators.isEmpty {
            
            i = 0..<operators.count ~= i ? i : 0
            let j = i + 1 < operators.count ? i + 1 : i
            
            if operators[i].precedence >= operators[j].precedence {
                let firstValue = operands.remove(at: i)
                let secondValue = operands.remove(at: i)

                operands.insert(operators[i].calculate(lhs: firstValue, rhs: secondValue), at: i)
                operators.remove(at: i)

                i -= 1
            } else {
                i += 1
            }
        }
        
        return operands.first ?? .nan
    }
}
