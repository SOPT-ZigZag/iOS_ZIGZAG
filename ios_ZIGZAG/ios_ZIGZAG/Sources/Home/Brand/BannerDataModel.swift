//
//  BannerDataModel.swift
//  ios_ZIGZAG
//
//  Created by kyoungjin on 2021/06/09.
//

import Foundation

// MARK: - BannerDataModel
struct BannerDataModel: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: Banner
}

// MARK: - DataClass
struct Banner: Codable {
    let img: String
    let bannerIdx: Int

    enum CodingKeys: String, CodingKey {
        case img
        case bannerIdx = "banner_idx"
    }
}
