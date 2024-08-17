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

    static let orientalMelonDataList = [
        WaterMelonData(category: "배꼽", similarity: 30),
        WaterMelonData(category: "타원형", similarity: 50),
        WaterMelonData(category: "상처", similarity: 70)
    ]

    static let peachMelonDataList = [
        WaterMelonData(category: "붉은", similarity: 30),
        WaterMelonData(category: "골", similarity: 50),
        WaterMelonData(category: "상처", similarity: 70)
    ]
}

struct FruitData {
    let fruit: String
    let fruitPart: String
}

extension FruitData {
    static let waterMelonDataList = [
        FruitData(fruit: "WATER_MELON", fruitPart: "WATER_MELON_CIRCULAR"),
        FruitData(fruit: "WATER_MELON", fruitPart: "WATER_MELON_STRIPES"),
        FruitData(fruit: "WATER_MELON", fruitPart: "WATER_MELON_NAVEL")
    ]

    static let orientalMelonDataList = [
        FruitData(fruit: "ORIENTAL_MELON", fruitPart: "ORIENTAL_MELON_NAVEL"),
        FruitData(fruit: "ORIENTAL_MELON", fruitPart: "ORIENTAL_MELON_OVAL"),
        FruitData(fruit: "ORIENTAL_MELON", fruitPart: "ORIENTAL_MELON_INJURY")
    ]

    static let peachDataList = [
        FruitData(fruit: "PEACH", fruitPart: "PEACH_RED"),
        FruitData(fruit: "PEACH", fruitPart: "PEACH_LINE"),
        FruitData(fruit: "PEACH", fruitPart: "PEACH_INJURY")
    ]
}

struct FrushRealData {
    static var frushRealDataList: [FrushResponse] = []
}
