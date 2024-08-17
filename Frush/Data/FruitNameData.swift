//
//  FruitNameData.swift
//  Frush
//
//  Created by 박지윤 on 8/17/24.
//

struct FruitNameData {
    let kor: String
    let eng: String
}

extension FruitNameData {
    static let waterMelonName = FruitNameData(kor: "수박", eng: "WATER_MELON")
    static let orientalMelonName = FruitNameData(kor: "참외", eng: "ORIENTAL_MELON")
    static let peachName = FruitNameData(kor: "복숭아", eng: "PEACH")
}
