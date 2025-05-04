//
//  ContentView.swift
//  ConvertMoney
//
//  Created by Roger La Rosa on 04/05/2025.
//

import SwiftUI



struct ConverterView: View {
    
    @StateObject private var viewModel = CurrencyConverterViewModel()
    @FocusState private var amountIsFocused: Bool
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker("Target currency", selection: $viewModel.sourceCurrency) {
                        ForEach(Currency.allCases, id:\.self) {
                            Text("\($0.rawValue)")
                        }
                    }
                    .pickerStyle(.menu)
                    Picker("Convert to", selection: $viewModel.targetCurrency) {
                        ForEach(Currency.allCases, id:\.self) {
                            Text("\($0.rawValue)")
                        }
                    }
                    .pickerStyle(.menu)
                }
                header: {
                    Text("Select currencies for conversion")
                }
                
                Section {
                    TextField("Amount",
                              value: $viewModel.amount,
                              format: .currency(code: viewModel.targetCurrency.rawValue))
                    .keyboardType(.decimalPad)
                    .focused($amountIsFocused)
                }
                header: {
                    Text("Please select your amount")
                }
                footer: {
                    Text("1 \(viewModel.targetCurrency.name) equals \(viewModel.exchangeRate) \(viewModel.targetCurrency.name)")
                }
                
                Section {
                    Text(viewModel.convertedAmount, format: .currency(code: viewModel.targetCurrency.rawValue))
                }
                header: {
                    Text("Conversion \(viewModel.targetCurrency.rawValue) => \(viewModel.targetCurrency.rawValue)")
                }
            }
            .navigationTitle("WeSplito")
            .toolbar {
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
    
}

#Preview {
    ConverterView()
}
