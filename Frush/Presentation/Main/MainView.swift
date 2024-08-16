//
//  MainView.swift
//  Frush
//
//  Created by 박지윤 on 8/16/24.
//

import UIKit

final class MainView: BaseView {

    // MARK: UI Components
    private let guideLabel = UILabel().then {
        $0.text = "프루시에서\n맛있는 과일을 골라보세요!"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        $0.textAlignment = .left
        $0.numberOfLines = 2
    }

    private let frushButtonStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 36
        $0.distribution = .fillEqually
    }

    private var buttonConfiguration = BaseButton.Configuration.plain()
    private let waterMelonButton = BaseButton()
    private let koreanMelonButton = BaseButton()
    private let peachButton = BaseButton()

    // MARK: Properties
    var tapWaterMelonButton: (() -> Void)?
    var tapKoreanMelonButton: (() -> Void)?
    var tapPeachButton: (() -> Void)?

    // MARK: Configuration
    override func configureSubviews() {
        setButtonConfiguration()

        addSubview(guideLabel)
        addSubview(frushButtonStackView)

        frushButtonStackView.addArrangedSubviews(waterMelonButton,
                                                 koreanMelonButton,
                                                 peachButton)

        waterMelonButton.addTarget(self, action: #selector(handleWaterMelonButtonEvent), for: .touchUpInside)
        koreanMelonButton.addTarget(self, action: #selector(handleKoreanMelonButtonEvent), for: .touchUpInside)
        peachButton.addTarget(self, action: #selector(handlePeachButtonEvent), for: .touchUpInside)
    }

    // MARK: Layout
    override func makeConstraints() {
        guideLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).inset(52)
            $0.leading.equalToSuperview()
        }

        frushButtonStackView.snp.makeConstraints {
            $0.top.equalTo(guideLabel.snp.bottom).offset(24)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(462)
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

extension MainView {
    func configureButton(_ button: UIButton, title: String, image: UIImage) {
        var attributedTitle = AttributedString(title)
        attributedTitle.font = .systemFont(ofSize: 22, weight: .bold)
        attributedTitle.foregroundColor = UIColor.black

        var config = buttonConfiguration
        config.attributedTitle = attributedTitle
        config.image = image
        config.imagePadding = 74
        config.imagePlacement = .trailing
        config.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 70, bottom: 0, trailing: 20)
        config.background.backgroundColor = .lightOrange
        config.background.cornerRadius = 10

        button.configuration = config
    }

    func setButtonConfiguration() {
        configureButton(waterMelonButton, title: "수박", image: FrushImage.waterMelon)
        configureButton(koreanMelonButton, title: "참외", image: FrushImage.koreanMelon)
        configureButton(peachButton, title: "복숭아", image: FrushImage.peach)
    }
}
