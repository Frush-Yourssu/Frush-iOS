//
//  MainView.swift
//  Frush
//
//  Created by 박지윤 on 8/16/24.
//

import UIKit

final class MainView: BaseView {

    // MARK: UI Components
    private let waterMelonButton = BaseButton().then {
        $0.setTitle("수박", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.backgroundColor = .lightGray
    }

    private let koreanMelonButton = BaseButton().then {
        $0.setTitle("참외", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.backgroundColor = .lightGray
    }

    private let peachButton = BaseButton().then {
        $0.setTitle("복숭아", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.backgroundColor = .lightGray
    }

    // MARK: Properties
    var tapWaterMelonButton: (() -> Void)?
    var tapKoreanMelonButton: (() -> Void)?
    var tapPeachButton: (() -> Void)?

    // MARK: Configuration
    override func configureSubviews() {
        super.configureSubviews()

        addSubview(waterMelonButton)
        addSubview(koreanMelonButton)
        addSubview(peachButton)

        waterMelonButton.addTarget(self, action: #selector(handleWaterMelonButtonEvent), for: .touchUpInside)
        koreanMelonButton.addTarget(self, action: #selector(handleKoreanMelonButtonEvent), for: .touchUpInside)
        peachButton.addTarget(self, action: #selector(handlePeachButtonEvent), for: .touchUpInside)
    }

    // MARK: Layout
    override func makeConstraints() {
        super.makeConstraints()

        waterMelonButton.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).inset(30)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(261)
            $0.height.equalTo(100)
        }

        koreanMelonButton.snp.makeConstraints {
            $0.top.equalTo(waterMelonButton.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(261)
            $0.height.equalTo(100)
        }

        peachButton.snp.makeConstraints {
            $0.top.equalTo(koreanMelonButton.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(261)
            $0.height.equalTo(100)
        }
    }

    // MARK: Event
    @objc private func handleWaterMelonButtonEvent() {
        tapWaterMelonButton?()
    }

    @objc private func handleKoreanMelonButtonEvent() {
        tapKoreanMelonButton?()
    }

    @objc private func handlePeachButtonEvent() {
        tapPeachButton?()
    }
}
