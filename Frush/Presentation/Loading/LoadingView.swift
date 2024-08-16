//
//  LoadingView.swift
//  Frush
//
//  Created by 박지윤 on 8/16/24.
//

import UIKit
import Lottie

final class LoadingView: BaseView {

    // MARK: UI Components
    private let loadingLabel = UILabel().then {
        $0.text = "결과를 분석 중입니다.."
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    }

    private let loadingAnimationView = LottieAnimationView(name: "loading_animation")

    private let nextButton = BaseButton().then {
        $0.setDefaultButton("결과 확인하기")
    }

    // MARK: Properties
    var tapNextButton: (() -> Void)?

    // MARK: Configuration
    override func configureSubviews() {
        addSubview(loadingLabel)
        addSubview(loadingAnimationView)
        addSubview(nextButton)

        nextButton.addTarget(self, action: #selector(handleNextButtonEvent), for: .touchUpInside)

        setLoadingViewAnimation()
    }

    // MARK: Layout
    override func makeConstraints() {
        loadingLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).inset(56)
            $0.centerX.equalToSuperview()
        }

        loadingAnimationView.snp.makeConstraints {
            $0.top.equalTo(loadingLabel.snp.bottom).offset(117)
            $0.centerX.equalToSuperview()
            $0.height.width.equalTo(300)
        }

        nextButton.snp.makeConstraints {
            $0.bottom.equalTo(safeAreaLayoutGuide).inset(34)
            $0.width.equalToSuperview()
        }
    }

    // MARK: Event
    @objc private func handleNextButtonEvent() {
        tapNextButton?()
    }

    private func setLoadingViewAnimation() {
        loadingAnimationView.play()
        loadingAnimationView.loopMode = .loop
    }
}
