//
//  ResultStackView.swift
//  Frush
//
//  Created by 박지윤 on 8/16/24.
//

import UIKit

final class ResultDetailView: UIView {

    // MARK: UI Component
    private let resultStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 28
    }

    // MARK: Init
    init() {
        super.init(frame: .zero)

        configureSubviews()
        makeConstraints()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Configuration
    private func configureSubviews() {
        addSubview(resultStackView)

        layer.cornerRadius = 20
        layer.borderWidth = 1
        layer.borderColor = UIColor.frushOrange.cgColor
    }

    // MARK: Layout
    private func makeConstraints() {
        snp.makeConstraints {
            $0.height.equalTo(185)
        }

        resultStackView.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview().inset(33)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(119)
        }
    }

    func setData(waterMelonDataList: [WaterMelonData]) {
        for waterMelonData in waterMelonDataList {
            let category = waterMelonData.category
            let similarity = waterMelonData.similarity

            let resultContentView = ResultContentView(
                category: category,
                similarity: similarity)

            resultStackView.addArrangedSubview(resultContentView)
        }
    }
}
