//
//  Calculate.swift
//  delegateDemo
//
//  Created by Greg on 07/10/2021.
//

import Foundation



enum CalculatorError: Error {
    case cannotAddAnOperatorAfterAnother
}

class Calculator {
        
    private var operation: String = "" {
        didSet {
            didUpdateOperation?(operation)
        }
    }
    
    func addNumber(number: Int) {
        operation += number.description
    }
    
    
    func addOperator(mathOperator: String) throws {
        
        guard
            operation.last != "+" &&
                operation.last != "-"
        else {
            throw CalculatorError.cannotAddAnOperatorAfterAnother
        }
        
        operation += mathOperator
    }
    
    var didUpdateOperation: ((String) -> Void)?
    
}
