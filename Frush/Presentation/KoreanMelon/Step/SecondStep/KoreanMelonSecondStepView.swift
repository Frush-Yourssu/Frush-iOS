//
//  KoreanMelonSecondStepView.swift
//  Frush
//
//  Created by 성현주 on 8/17/24.
//

import UIKit

final class KoreanMelonSecondStepView: BaseView {

    // MARK: UI Components
    private let progressBarImageView = UIImageView().then {
        $0.image = FrushImage.secondProgressBar
    }

    private let guideLabel = UILabel().then {
        $0.setDefaultLabel("타원형 참외가 맛있다!")
    }

    private let koreanMelonImageView = UIImageView().then {
        $0.image = FrushImage.koreanMelonStep2
    }

    private let cameraButton = BaseButton().then {
        $0.setDefaultButton("사진찍기")
    }

    // MARK: Properties
    var tapCameraButton: (() -> Void)?

    // MARK: Configuration
    override func configureSubviews() {
        addSubview(progressBarImageView)
        addSubview(koreanMelonImageView)
        addSubview(guideLabel)
        addSubview(cameraButton)

        cameraButton.addTarget(self, action: #selector(handleCameraButtonEvent), for: .touchUpInside)
    }

    // MARK: Layout
    override func makeConstraints() {
        progressBarImageView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).inset(12)
            $0.width.equalToSuperview()
        }

        guideLabel.snp.makeConstraints {
            $0.top.equalTo(progressBarImageView.snp.bottom).offset(40)
            $0.centerX.equalToSuperview()
        }

        koreanMelonImageView.snp.makeConstraints {
            $0.top.equalTo(guideLabel.snp.bottom).offset(56)
            $0.centerX.equalToSuperview()
            $0.height.width.equalTo(343)
        }

        cameraButton.snp.makeConstraints {
            $0.bottom.equalTo(safeAreaLayoutGuide).inset(34)
            $0.width.equalToSuperview()
        }
    }

    // MARK: Event
    @objc private func handleCameraButtonEvent() {
        tapCameraButton?()
    }
}

