//
//  CurrencyServiceProtocol.swift
//  ConvertMoney
//
//  Created by Roger La Rosa on 04/05/2025.
//

protocol ExchangeRateServiceProtocol {
    func fetchRates(for baseCurrency: Currency) async throws -> [String: Double] 
}
