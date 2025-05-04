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
    
    @Published var amount = 10_000.0
    @Published var sourceCurrency: Currency = .jpy
    @Published var targetCurrency: Currency = .eur
    @Published var convertedAmount = 0.0
    @Published var exchangeRate = 0.0
    
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    // MARK: - Exchange Rate Properties
    private var rates: [String: Double] = [:]
    private var cancellables = Set<AnyCancellable>()
    private let exchangeRateService: ExchangeRateServiceProtocol
    
    // MARK: - Initialization
    init(exchangeRateService: ExchangeRateServiceProtocol = ExchangeRateService()) {
        self.exchangeRateService = exchangeRateService
        
        // Set up bindings to automatically convert when inputs change
        setupBindings()
        
        // Initial fetch of rates
        fetchLatestRates()
    }
    
    // MARK: - Public Methods
    func fetchLatestRates() {
        isLoading = true
        errorMessage = nil
        
        Task {
            do {
                rates = try await exchangeRateService.fetchRates(for: sourceCurrency)
                await MainActor.run {
                    self.isLoading = false
                    self.convert()
                }
            } catch {
                await MainActor.run {
                    self.isLoading = false
                    self.errorMessage = "Impossible de récupérer les taux: \(error.localizedDescription)"
                }
            }
        }
    }
    
    // MARK: - Private Methods
    private func setupBindings() {
        
        var previousCurrency: Currency = sourceCurrency
        
        $sourceCurrency
            .sink { [weak self] newCurrency in
                if previousCurrency != newCurrency {
                    print("Currency changed from \(previousCurrency.rawValue) to \(newCurrency.rawValue)")
                    self?.fetchLatestRates()
                    previousCurrency = newCurrency
                }
            }
            .store(in: &cancellables)
        
        Publishers.CombineLatest($amount, $targetCurrency)
            .dropFirst()
            .sink { [weak self] _, _ in
                print("Amount or target currency changed")
                self?.convert()
            }
            .store(in: &cancellables)
    }
    
    private func convert() {
        guard let rate = rates[targetCurrency.rawValue.lowercased()] else {
            errorMessage = "Taux de change non disponible pour \(targetCurrency.name)"
            return
        }
        
        exchangeRate = rate
        convertedAmount = amount * rate
    }
}
