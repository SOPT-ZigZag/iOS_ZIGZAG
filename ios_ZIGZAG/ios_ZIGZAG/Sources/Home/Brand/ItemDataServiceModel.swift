//
//  ItemDataServiceModel.swift
//  ios_ZIGZAG
//
//  Created by kyoungjin on 2021/06/10.
//

import Foundation

// MARK: - Welcome
struct ItemDataServiceModel: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let item: [Item]
}

// MARK: - Item
struct Item: Codable {
    let id: String
    let img: String
    let itemIdx: Int
    let brandName, itemName: String
    let price, discountIdx, deliveryIdx: Int
    let deliveryToday: Bool

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case img
        case itemIdx = "item_idx"
        case brandName = "brand_name"
        case itemName = "item_name"
        case price
        case discountIdx = "discount_idx"
        case deliveryIdx = "delivery_idx"
        case deliveryToday = "delivery_today"
    }
}
