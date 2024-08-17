//
//  Frush.swift
//  Frush
//
//  Created by 박지윤 on 8/17/24.
//

public enum Frush {
    case WATER_MELON
    case ORIENTAL_MELON
    case PEACH

    var fruitName: FruitNameData {
        switch self {
        case .WATER_MELON:
            return FruitNameData.waterMelonName
        case .ORIENTAL_MELON:
            return FruitNameData.orientalMelonName
        case .PEACH:
            return FruitNameData.peachName
        }
    }

    var fruitPart: [FruitPartData] {
        switch self {
        case .WATER_MELON:
            return FruitPartData.waterMelonPartList
        case .ORIENTAL_MELON:
            return FruitPartData.orientalMelonPartList
        case .PEACH:
            return FruitPartData.peachPartList
        }
    }

    var fruitStep: StepData {
        switch self {
        case .WATER_MELON:
            return StepData.waterMelonStepList
        case .ORIENTAL_MELON:
            return StepData.orientalMelonStepList
        case .PEACH:
            return StepData.peachStepList
        }
    }

    var fruitResult: [ResultData] {
        switch self {
        case .WATER_MELON:
            return ResultData.waterMelonResultList
        case .ORIENTAL_MELON:
            return ResultData.orientalMelonResultList
        case .PEACH:
            return ResultData.peachResultList
        }
    }
}
