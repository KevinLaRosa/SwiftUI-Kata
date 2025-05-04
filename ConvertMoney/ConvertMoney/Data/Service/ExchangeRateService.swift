//
//  ExchangeRateService.swift
//  ConvertMoney
//
//  Created by Roger La Rosa on 04/05/2025.
//
import Foundation

class ExchangeRateService: ExchangeRateServiceProtocol {
    func fetchRates(for baseCurrency: Currency) async throws -> [String: Double] {
        let urlString = "https://cdn.jsdelivr.net/npm/@fawazahmed0/currency-api@latest/v1/currencies/\(baseCurrency.rawValue.lowercased()).json"
    
        
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        // Afficher le JSON brut pour l'inspecter
           if let jsonString = String(data: data, encoding: .utf8) {
               print("JSON brut: \(jsonString)")
           }
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        let decoder = JSONDecoder()
        let ratesResponse = try decoder.decode(CurrencyRatesDTO.self, from: data)
        
        return ratesResponse.getRates()
    }
}
