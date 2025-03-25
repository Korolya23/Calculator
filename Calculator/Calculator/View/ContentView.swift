//
//  ContentView.swift
//  Calculator
//
//  Created by Artem on 24.03.25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CalculateViewModel()

    var body: some View {
        VStack(spacing: 10) {
            Text(viewModel.currentValue)
                .font(.system(size: 32, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding(.horizontal, 20)
        
            VStack(spacing: 10) {
                HStack(spacing: 10) {
                    CustomButton(text: "C", action: {
                        viewModel.clear()
                    }, color: .red)
                    
                    CustomButton(text: "+", action: {
                        viewModel.pressOperation(.add)
                    }, color: .orange)
                    
                    CustomButton(text: "×", action: {
                        viewModel.pressOperation(.multiply)
                    }, color: .orange)
                    
                    CustomButton(text: "-", action: {
                        viewModel.pressOperation(.subtract)
                    }, color: .orange)
                }
                
                HStack(spacing: 10) {
                    CustomButton(text: "7", action: {
                        viewModel.pressNumber("7")
                    })
                    
                    CustomButton(text: "8", action: {
                        viewModel.pressNumber("8")
                    })
                    
                    CustomButton(text: "9", action: {
                        viewModel.pressNumber("9")
                    })
                    
                    CustomButton(text: "/", action: {
                        viewModel.pressOperation(.divide)
                    }, color: .orange)
                }
                
                HStack(spacing: 10) {
                    CustomButton(text: "4", action: {
                        viewModel.pressNumber("4")
                    })
                    
                    CustomButton(text: "5", action: {
                        viewModel.pressNumber("5")
                    })
                    
                    CustomButton(text: "6", action: {
                        viewModel.pressNumber("6")
                    })
                    
                    CustomButton(text: "=", action: {
                        viewModel.calculate()
                    }, color: .green)
                }
                
                HStack(spacing: 10) {
                    CustomButton(text: "1", action: {
                        viewModel.pressNumber("1")
                    })
                    
                    CustomButton(text: "2", action: {
                        viewModel.pressNumber("2")
                    })
                    
                    CustomButton(text: "3", action: {
                        viewModel.pressNumber("3")
                    })
                    
                    CustomButton(text: "⌫", action: {
                        if viewModel.currentValue.count > 1 {
                            viewModel.currentValue.removeLast()
                        } else {
                            viewModel.currentValue = "0"
                        }
                    }, color: .gray)
                    
                }
                
                HStack(spacing: 10) {
                    CustomButton(text: "0", action: {
                        viewModel.pressNumber("0")
                    })
                    
                    CustomButton(text: ".", action: {
                        if !viewModel.currentValue.contains(".") {
                            viewModel.pressNumber(".")
                        }
                    })
                }
            }
            .padding(.vertical, 10)
        }
    }
}

#Preview {
    ContentView()
}
