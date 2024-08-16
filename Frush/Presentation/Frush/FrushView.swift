//
//  FrushView.swift
//  Frush
//
//  Created by 박지윤 on 8/17/24.
//

import UIKit

final class FrushView: BaseView {

    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: UI Components
    private let guideLabel = UILabel()
    private let frushImageView = UIImageView()

    private let startButton = BaseButton().then {
        $0.setDefaultButton("시작하기")
    }

    // MARK: Properties
    var tapStartButton: (() -> Void)?

    // MARK: Configuration
    override func configureSubviews() {
        addSubview(guideLabel)
        addSubview(frushImageView)
        addSubview(startButton)

        startButton.addTarget(self, action: #selector(handleStartButtonEvent), for: .touchUpInside)
    }

    // MARK: Layout
    override func makeConstraints() {
        guideLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).inset(137)
            $0.centerX.equalToSuperview()
        }

        frushImageView.snp.makeConstraints {
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

    func setData(guideText: String, frushImage: UIImage) {
        guideLabel.setDefaultLabel(guideText)
        frushImageView.image = frushImage
    }
}
