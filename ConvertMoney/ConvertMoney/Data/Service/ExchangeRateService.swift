//
//  ExchangeRateService.swift
//  ConvertMoney
//
//  Created by Roger La Rosa on 04/05/2025.
//
import Foundation

class ExchangeRateService: ExchangeRateServiceProtocol {
    private let maxRetries = 3
    private let retryDelay: UInt64 = 1_000_000_000 // 1 second in nanoseconds
    
    func fetchRates(for baseCurrency: Currency) async throws -> [String: Double] {
        var lastError: Error?
        
        for attempt in 1...maxRetries {
            do {
                let currencyCode = baseCurrency.rawValue.lowercased()
                // Using Frankfurter API which is free and doesn't require authentication
                let urlString = "https://api.frankfurter.app/latest?from=\(currencyCode)"
                
                print("Fetching rates for currency: \(currencyCode) (Attempt \(attempt)/\(maxRetries))")
                print("URL: \(urlString)")
                
                guard let url = URL(string: urlString) else {
                    throw URLError(.badURL)
                }
                
                var request = URLRequest(url: url)
                request.timeoutInterval = 30
                request.cachePolicy = .reloadIgnoringLocalCacheData
                request.httpMethod = "GET"
                request.setValue("application/json", forHTTPHeaderField: "Accept")
                
                let (data, response) = try await URLSession.shared.data(for: request)
                
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw URLError(.badServerResponse)
                }
                
                guard httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                
                // Print raw JSON for debugging
                if let jsonString = String(data: data, encoding: .utf8) {
                    print("Raw JSON response: \(jsonString)")
                }
                
                let decoder = JSONDecoder()
                let ratesResponse = try decoder.decode(FrankfurterResponse.self, from: data)
                
                // Convert rates to lowercase keys for consistency
                let rates = Dictionary(uniqueKeysWithValues: ratesResponse.rates.map { 
                    ($0.key.lowercased(), $0.value)
                })
                
                print("Successfully decoded rates: \(rates)")
                return rates
                
            } catch {
                lastError = error
                print("Attempt \(attempt) failed with error: \(error)")
                
                if attempt < maxRetries {
                    print("Retrying in 1 second...")
                    try await Task.sleep(nanoseconds: retryDelay)
                }
            }
        }
        
        throw lastError ?? URLError(.unknown)
    }
}

// Response model for the Frankfurter API
struct FrankfurterResponse: Decodable {
    let amount: Double
    let base: String
    let date: String
    let rates: [String: Double]
}
