//
//  ResultData.swift
//  Frush
//
//  Created by 박지윤 on 8/17/24.
//

import UIKit

struct ResultData {
    let title: String
    let description: String
}

extension ResultData {
    static let waterMelonResultList = [
        ResultData(title: "맛없는 참외", description: "달콤함을 기대하지 마세요.. 씁쓸할 거예요."),
        ResultData(title: "조금 아쉬운 수박", description: "어느 정도 수박의 맛은 느낄 수 있을지도?\n기대는 적당히!"),
        ResultData(title: "괜찮은 수박", description: "달달하면서도 시원한 여름의 맛을\n느낄 수 있을 거에요."),
        ResultData(title: "진짜 맛있는 수박", description: "이 수박이면 더운 여름도 견딜 수\n있을 거에요. 지금 바로 드셔보세요!")
    ]

    static let koreanMelonResultList = [
        ResultData(title: "맛없는 참외", description: "달콤함은 없고, 그냥 물 같은 느낌이에요. ㅠㅠ"),
        ResultData(title: "조금 아쉬운 참외", description: "참외의 향은 있지만, 단맛이 부족해요."),
        ResultData(title: "괜찮은 참외", description: "좋은 선택!\n아삭하고 달달한 맛이 좋아요."),
        ResultData(title: "진짜 맛있는 참외", description: "참외 중의 참외,\n달콤함의 끝판왕이에요!")
    ]

    static let peachResultList = [
        ResultData(title: "맛없는 참외", description: "이 복숭아는 아직 준비가 안 됐어요!\n참으세요"),
        ResultData(title: "조금 아쉬운 참외", description: "단맛이 덜해요, 기다리면 더 맛있을지도?"),
        ResultData(title: "괜찮은 참외", description: "맛있게 먹을 수 있는 복숭아에요!"),
        ResultData(title: "진짜 맛있는 참외", description: "이건 진짜 복숭아의 정석,\n최고로 맛있는 복숭아에요!")
    ]
}
