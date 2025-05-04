//
//  CurrencyConverterViewModel.swift
//  ConvertMoney
//
//  Created by Roger La Rosa on 04/05/2025.
//
import Foundation
import Combine

class CurrencyConverterViewModel: ObservableObject {
    
    // MARK: - Published Properties
    
    @Published var amount = 10_000
    @Published var sourceCurrency: Currency = .jpy
    @Published var targetCurrency: Currency = .eur
    @Published var convertedAmount = 10.0
    @Published var exchangeRate = 10.0
    
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    // MARK: - Exchange Rate Properties
    private var rates: [Currency: Double] = [:]
    private var cancellables = Set<AnyCancellable>()
    private let currencyService: ExchangeRateServiceProtocol
    
    // MARK: - Initialization
    init(currencyService: ExchangeRateServiceProtocol = ExchangeRateService()) {
        self.currencyService = currencyService
        
        // Set up bindings to automatically convert when inputs change
        setupBindings()
        
        // Initial fetch of rates
        //fetchLatestRates()
    }
    
    // MARK: - Private Methods
    private func setupBindings() {
        // Automatically convert when any input changes
        Publishers.CombineLatest3($amount, $sourceCurrency, $targetCurrency)
            .debounce(for: 0.5, scheduler: RunLoop.main) // Debounce for better UX
            .sink { [weak self] _, _, _ in
                //self?.convert()
            }
            .store(in: &cancellables)
    }
}
