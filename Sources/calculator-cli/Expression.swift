//
//  Expression.swift
//  
//
//  Created by Juan Felipe Mendez Peralta on 1/02/22.
//

import Foundation

struct Expression {
    let expression: String
    
    private(set) var operators: [Operator] = []
    private(set) var operands: [Double] = []
    
    private let acceptedPattern = "(?<!\\d)\\d+(?:\\.\\d+)?|[-+]{1,}|[*/]{1}"
    
    init?(expression: String) {
        self.expression = expression
        if !self.isValidExpression() {
            return nil
        }
    }
    
    mutating private func isValidExpression() -> Bool {
        if let lastChar = self.expression.last,
           Operator(rawValue: String(lastChar)) != nil {
            return false
        }
        do {
            let regex = try NSRegularExpression(pattern: self.acceptedPattern)
            let results = regex.matches(in: self.expression, range: NSRange(self.expression.startIndex..., in: self.expression))
            let tokenizedExpression = self.buidlExpression(with: results)
            return tokenizedExpression.joined(separator: "") == self.expression && self.operators.count == self.operands.count - 1
        } catch {
           return false
        }
    }
    
    mutating private func buidlExpression(with tokens: [NSTextCheckingResult]) -> [String] {
        return tokens.map {
            let element = String(self.expression[Range($0.range, in: self.expression)!])
            if self.isOperator(element) {
                self.operators.append(self.transform(operatorToken: element))
                if self.operands.isEmpty {
                    self.operands.append(0.0)
                }
            } else {
                self.operands.append(Double(element) ?? .nan)
            }
            return String(self.expression[Range($0.range, in: self.expression)!])
        }
    }
    
    private func isOperator(_ token: String) -> Bool {
        guard let firstChar = token.first else {
            return false
        }
        return Operator(rawValue: String(firstChar)) != nil
    }
    
    private func transform(operatorToken: String) -> Operator {
        if let op = Operator(rawValue: operatorToken) {
            return op
        }
        var negativeCount = 0
        operatorToken.forEach {
            if let symbol = Operator(rawValue: String($0)),
               symbol == .subtract {
                negativeCount += 1
            }
        }
        return negativeCount % 2 == 0 ? .add : .subtract
    }
}
