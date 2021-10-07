//
//  ViewController.swift
//  delegateDemo
//
//  Created by Greg on 07/10/2021.
//

import UIKit

class ViewController: UIViewController {
    
    private let calculator = Calculator()
    
    @IBOutlet weak var operationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calculator.delegate = self
    }
    
    @IBAction func didTapOnNumberButton(_ sender: UIButton) {
        guard
            let numberAsString = sender.titleLabel?.text,
            let number = Int(numberAsString)
        else { return }
        
        calculator.addNumber(number: number)
    }
    
}

extension ViewController: CalculatorProtocol {
    func didUpdateOperation(operation: String) {
        operationLabel.text = operation
    }
    
}
