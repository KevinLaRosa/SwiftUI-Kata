//
//  RatesResponseDTO.swift
//  ConvertMoney
//
//  Created by Roger La Rosa on 04/05/2025.
//

struct CurrencyRatesDTO: Decodable {
    let date: String
    // Propriété dynamique pour stocker les taux
    private var rates: [String: Double] = [:]
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)
        
        // Décodage de la date
        if let dateKey = container.allKeys.first(where: { $0.stringValue == "date" }) {
            date = try container.decode(String.self, forKey: dateKey)
        } else {
            date = ""
        }
        
        // Récupération de la clé de devise (eur, usd, etc.)
        if let currencyKey = container.allKeys.first(where: { $0.stringValue != "date" }) {
            rates = try container.decode([String: Double].self, forKey: currencyKey)
        }
    }
    
    // Méthode pour accéder aux taux
    func getRates() -> [String: Double] {
        return rates
    }
    
    // Clés de décodage dynamiques
    private struct DynamicCodingKeys: CodingKey {
        var stringValue: String
        var intValue: Int?
        
        init?(stringValue: String) {
            self.stringValue = stringValue
            self.intValue = nil
        }
        
        init?(intValue: Int) {
            return nil
        }
    }
}
