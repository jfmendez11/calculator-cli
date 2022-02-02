//
//  Operator.swift
//  
//
//  Created by Juan Felipe Mendez Peralta on 1/02/22.
//

import Foundation

enum Operator: String {
    case add = "+"
    case subtract = "-"
    case multiply = "*"
    case divide = "/"
    
    var precedence: Int {
        switch self {
        case .add: return 1
        case .subtract: return 0
        case .multiply: return 2
        case .divide: return 3
        }
    }

    func calculate(lhs: Double, rhs: Double) -> Double {
        switch self {
        case .add:
            return lhs + rhs
        case .subtract:
            return lhs - rhs
        case .multiply:
            return lhs * rhs
        case .divide:
            if rhs == 0.0 { return .nan }
            return lhs / rhs
        }
    }
}
