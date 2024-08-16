//
//  FirstStepView.swift
//  Frush
//
//  Created by 박지윤 on 8/16/24.
//

import UIKit

final class FirstStepView: BaseView {

    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: UI Components
    private let progressBarImageView = UIImageView().then {
        $0.image = FrushImage.firstProgressBar
    }

    private let guideLabel = UILabel()
    private let frushImageView = UIImageView()

    private let cameraButton = BaseButton().then {
        $0.setDefaultButton("사진찍기")
    }

    // MARK: Properties
    var tapCameraButton: (() -> Void)?

    // MARK: Configuration
    override func configureSubviews() {
        addSubview(progressBarImageView)
        addSubview(guideLabel)
        addSubview(frushImageView)
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

        frushImageView.snp.makeConstraints {
            $0.top.equalTo(guideLabel.snp.bottom).offset(53)
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

    func setData(guideText: String, frushImage: UIImage) {
        guideLabel.setDefaultLabel(guideText)
        frushImageView.image = frushImage
    }
}
