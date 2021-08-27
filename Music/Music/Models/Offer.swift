// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let offer = try? newJSONDecoder().decode(Offer.self, from: jsonData)

import Foundation

// MARK: - Offer
struct Offer: Codable {
    var id: Int?
    var name, amount, currency, displayedAmount: String?
    var tc: String?
    var tcHTML, tcTxt: String?
    var tryAndBuy: Int?

    enum CodingKeys: String, CodingKey {
        case id, name, amount, currency
        case displayedAmount = "displayed_amount"
        case tc
        case tcHTML = "tc_html"
        case tcTxt = "tc_txt"
        case tryAndBuy = "try_and_buy"
    }
}
