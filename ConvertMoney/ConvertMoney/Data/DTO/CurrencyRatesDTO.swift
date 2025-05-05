struct CurrencyRatesDTO: Decodable {
    let date: String
    // Propriété dynamique pour stocker les taux
    private var rates: [String: Double] = [:]
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)
        
        // Decode the date
        date = try container.decode(String.self, forKey: DynamicCodingKeys(stringValue: "date")!)
        
        // Get all keys except "date"
        let currencyKeys = container.allKeys.filter { $0.stringValue != "date" }
        
        // There should be exactly one currency key (e.g., "eur", "usd", etc.)
        guard let currencyKey = currencyKeys.first else {
            throw DecodingError.dataCorruptedError(
                forKey: DynamicCodingKeys(stringValue: "rates")!,
                in: container,
                debugDescription: "No currency key found in response"
            )
        }
        
        // Decode the nested rates object
        let ratesContainer = try container.nestedContainer(keyedBy: DynamicCodingKeys.self, forKey: currencyKey)
        
        // Convert all rates to lowercase keys
        for key in ratesContainer.allKeys {
            let rate = try ratesContainer.decode(Double.self, forKey: key)
            rates[key.stringValue.lowercased()] = rate
        }
    }
    
    // Méthode pour accéder aux taux
    func getRates() -> [String: Double] {
        return rates
    }
    
    // Clés de décodage dynamiques 
    struct DynamicCodingKeys: CodingKey {
        var stringValue: String
        var intValue: Int?
        
        init?(stringValue: String) {
            self.stringValue = stringValue
        }
        
        init?(intValue: Int) {
            self.intValue = intValue
            self.stringValue = "\(intValue)"
        }
    }
}
