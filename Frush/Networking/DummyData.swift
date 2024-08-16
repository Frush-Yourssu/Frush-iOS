//
//  DummyData.swift
//  Frush
//
//  Created by 박지윤 on 8/16/24.
//

import UIKit

struct WaterMelonData {
    let category: String
    let similarity: Double
}

extension WaterMelonData {
    static let waterMelonDataList = [
        WaterMelonData(category: "배꼽", similarity: 30),
        WaterMelonData(category: "모양", similarity: 50),
        WaterMelonData(category: "줄무늬", similarity: 70)
    ]
}
