//
//  FruitPartData.swift
//  Frush
//
//  Created by 박지윤 on 8/17/24.
//

struct FruitPartData {
    let kor: String
    let eng: String
}

extension FruitPartData {
    static let waterMelonPartList = [
        FruitPartData(kor: "원형", eng: "WATER_MELON_CIRCULAR"),
        FruitPartData(kor: "줄무늬", eng: "WATER_MELON_STRIPES"),
        FruitPartData(kor: "배꼽", eng: "WATER_MELON_NAVEL")
    ]

    static let orientalMelonPartList = [
        FruitPartData(kor: "배꼽", eng: "ORIENTAL_MELON_NAVEL"),
        FruitPartData(kor: "타원형", eng: "ORIENTAL_MELON_OVAL"),
        FruitPartData(kor: "상처", eng: "ORIENTAL_MELON_INJURY")
    ]

    static let peachPartList = [
        FruitPartData(kor: "붉은", eng: "PEACH_RED"),
        FruitPartData(kor: "골", eng: "PEACH_LINE"),
        FruitPartData(kor: "상처", eng: "PEACH_INJURY")
    ]
}
