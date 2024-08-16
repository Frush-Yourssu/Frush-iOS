//
//  SecondStepView.swift
//  Frush
//
//  Created by 박지윤 on 8/16/24.
//

import UIKit

final class SecondStepView: BaseView {

    // MARK: UI Components
    private let progressBarImageView = UIImageView().then {
        $0.image = FrushImage.secondProgressBar
    }

    private let guideLabel = UILabel().then {
        $0.setDefaultLabel("동그란 수박이 맛있다!")
    }

    private let waterMelonImageView = UIImageView().then {
        $0.image = FrushImage.waterMelonStep2
    }

    private let cameraButton = BaseButton().then {
        $0.setDefaultButton("사진찍기")
    }

    // MARK: Properties
    var tapCameraButton: (() -> Void)?

    // MARK: Configuration
    override func configureSubviews() {
        addSubview(progressBarImageView)
        addSubview(waterMelonImageView)
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

        waterMelonImageView.snp.makeConstraints {
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
