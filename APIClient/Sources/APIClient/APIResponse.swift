//
//  File.swift
//  
//
//  Created by Emir Alkal on 18.04.2023.
//

import Foundation

struct APIResponse: Codable {
    let code: Int
    let message: String
    let data: [StockData]
}

public struct StockData: Codable {
    public let date: String
    public let shortCode: String
    public let company: String
    public let media: StockIcon
    
    public enum CodingKeys: String, CodingKey {
        case date
        case shortCode = "short_code"
        case company
        case media
    }
}

public struct StockIcon: Codable {
    public let icon: String
}
