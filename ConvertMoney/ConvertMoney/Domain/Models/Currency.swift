//
//  Currency.swift
//  ConvertMoney
//
//  Created by Roger La Rosa on 04/05/2025.
//


enum Currency: String, CaseIterable, Identifiable {
    case eur = "EUR"  // Euro
    case usd = "USD"  // Dollar américain
    case jpy = "JPY"  // Yen japonais
    case idr = "IDR"  // Roupie indonésienne
    
    var id: String { rawValue }
    
    var symbol: String {
        switch self {
        case .eur: return "€"
        case .usd: return "$"
        case .jpy: return "¥"
        case .idr: return "Rp"
        }
    }
    
    var name: String {
        switch self {
        case .eur: return "Euro"
        case .usd: return "Dollar américain"
        case .jpy: return "Yen japonais"
        case .idr: return "Roupie indonésienne"
        }
    }
}
