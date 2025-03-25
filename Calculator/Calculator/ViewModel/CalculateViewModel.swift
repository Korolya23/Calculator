//
//  CalculateViewModel.swift
//  Calculator
//
//  Created by Artem on 24.03.25.
//

import Foundation

class CalculateViewModel: ObservableObject {
    @Published var currentValue: String = "0"
    @Published var firstValue: Double = 0
    @Published var secondValue: Double = 0
    @Published var currentOperation: Operation = .none
    
    func pressNumber(_ number: String) {
        if currentValue == "0" {
            currentValue = number
        } else {
            currentValue += number
        }
    }
    
    func pressOperation(_ operation: Operation) {
        if let value = Double(currentValue) {
            firstValue = value
            currentOperation = operation
            currentValue = "0"
        }
    }
    
    func calculate() {
        guard let value = Double(currentValue) else { return }
        
        secondValue = value
        var result: Double = 0
        
        switch currentOperation {
        case .add:
            result = firstValue + secondValue
        case .subtract:
            result = firstValue - secondValue
        case .multiply:
            result = firstValue * secondValue
        case .divide:
            result = firstValue / secondValue
        case .none:
            break
        }
        
        currentValue = String(result)
        currentOperation = .none
    }
    
    func clear() {
        currentValue = "0"
        firstValue = 0
        secondValue = 0
        currentOperation = .none
    }
}
