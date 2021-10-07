//
//  Calculate.swift
//  delegateDemo
//
//  Created by Greg on 07/10/2021.
//

import Foundation

protocol CalculatorProtocol: AnyObject {
    func didUpdateOperation(operation: String)
}


enum CalculatorError: Error {
    case cannotAddAnOperatorAfterAnother
}

class Calculator {
        
    private var operation: String = "" {
        didSet {
            delegate?.didUpdateOperation(operation: operation)
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
    
    weak var delegate: CalculatorProtocol?
}
