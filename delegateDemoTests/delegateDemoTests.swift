//
//  delegateDemoTests.swift
//  delegateDemoTests
//
//  Created by Greg on 07/10/2021.
//

import XCTest
@testable import delegateDemo

class delegateDemoTests: XCTestCase {
    var calculator: Calculator!
    var calculatorDelegateObjectMock: CalculatorDelegateObjectMock!

    
    override func setUp() {
        super.setUp()
        calculator = Calculator()
        calculatorDelegateObjectMock = CalculatorDelegateObjectMock()
        calculator.delegate = calculatorDelegateObjectMock
    }


    func test_givenEmptyOperation_whenAddNumber_thenNumberIsAddedToOperation() {
        
        // given
        XCTAssertTrue(calculatorDelegateObjectMock.operation.isEmpty)
        
        
        // when
        calculator.addNumber(number: 3)
        
        
        // then
        XCTAssertEqual(calculatorDelegateObjectMock.operation, "3")
    }

    
    
    func test_givenLastOperationCharacterIsOperator_whenAddOperator_thenGetcAnnotAddAnOperatorAfterAnotherError() throws {
        
        // given

        try calculator.addOperator(mathOperator: "+")
        XCTAssertEqual(calculatorDelegateObjectMock.operation, "+")
        
        
        // when => then
        

        XCTAssertThrowsError(try calculator.addOperator(mathOperator: "+")) { error in
            guard let error = error as? CalculatorError else {
                XCTFail()
                return
            }
            XCTAssertEqual(error, .cannotAddAnOperatorAfterAnother)
        }
    }



}





class CalculatorDelegateObjectMock: CalculatorProtocol {
    var operation: String = ""
    func didUpdateOperation(operation: String) {
        self.operation = operation
    }
    
    
}
