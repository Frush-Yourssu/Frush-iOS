//
//  WaterMelonView.swift
//  Frush
//
//  Created by 박지윤 on 8/16/24.
//

import UIKit

final class WaterMelonView: BaseView {

    // MARK: UI Components
    private let guideLabel = UILabel().then {
        $0.setDefaultLabel("맛있는 수박을 고르러 가볼까요?")
    }

    private let waterMelonImageView = UIImageView().then {
        $0.image = FrushImage.waterMelon
    }

    private let startButton = BaseButton().then {
        $0.setDefaultButton("시작하기")
    }

    // MARK: Properties
    var tapStartButton: (() -> Void)?

    // MARK: Configuration
    override func configureSubviews() {
        addSubview(guideLabel)
        addSubview(waterMelonImageView)
        addSubview(startButton)

        startButton.addTarget(self, action: #selector(handleStartButtonEvent), for: .touchUpInside)
    }

    // MARK: Layout
    override func makeConstraints() {
        guideLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).inset(137)
            $0.centerX.equalToSuperview()
        }

        waterMelonImageView.snp.makeConstraints {
            $0.top.equalTo(guideLabel.snp.bottom).offset(36)
            $0.centerX.equalToSuperview()
            $0.height.width.equalTo(300)
        }

        startButton.snp.makeConstraints {
            $0.bottom.equalTo(safeAreaLayoutGuide).inset(34)
            $0.width.equalToSuperview()
        }
    }

    // MARK: Event
    @objc private func handleStartButtonEvent() {
        tapStartButton?()
    }
}
