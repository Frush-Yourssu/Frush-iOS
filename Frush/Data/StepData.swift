//
//  StepData.swift
//  Frush
//
//  Created by 박지윤 on 8/17/24.
//

import UIKit

struct StepData {
    let title: String
    let step: [String]
    let stepImage: [UIImage]
}

extension StepData {
    static let waterMelonStepList =
        StepData(title: "맛있는 수박을 고르러 가볼까요?",
                 step: ["배꼽이 작을수록 맛있다!", "동그란 수박이 맛있다!", "줄무늬가 뚜렷한 수박이 맛있다!"],
                 stepImage: [FrushImage.waterMelonStep1, FrushImage.waterMelonStep2, FrushImage.waterMelonStep3]
        )

    static let orientalMelonStepList =
        StepData(title: "맛있는 참외를 고르러 가볼까요?",
                 step: ["배꼽이 작을수록 맛있다!", "타원형 참외가 맛있다!", "상처가 없는 참외가 맛있다!"],
                 stepImage: [FrushImage.orientalMelonStep1, FrushImage.orientalMelonStep2, FrushImage.orientalMelonStep3])

    static let peachStepList =
        StepData(title: "맛있는 복숭아를 고르러 가볼까요?",
                 step: ["붉은 색이 도는 것이 맛있다!", "복숭아 골이 선명하고\n좌우 대칭이어야 맛있다!", "상처가 없는 복숭아가 맛있다!"],
                 stepImage: [FrushImage.peachStep1, FrushImage.peachStep2, FrushImage.peachStep3])
}
