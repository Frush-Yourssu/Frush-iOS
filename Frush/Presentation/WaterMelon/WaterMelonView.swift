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
        $0.text = "맛있는 수박을 고르러 가볼까요?"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    }

    private let startButton = BaseButton().then {
        $0.setDefaultButton("시작하기")
    }

    // MARK: Properties
    var tapStartButton: (() -> Void)?

    // MARK: Configuration
    override func configureSubviews() {
        addSubview(guideLabel)
        addSubview(startButton)

        startButton.addTarget(self, action: #selector(handleStartButtonEvent), for: .touchUpInside)
    }

    // MARK: Layout
    override func makeConstraints() {
        guideLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).inset(50)
            $0.centerX.equalToSuperview()
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
