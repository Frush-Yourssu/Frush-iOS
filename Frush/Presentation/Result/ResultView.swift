//
//  ResultView.swift
//  Frush
//
//  Created by 박지윤 on 8/16/24.
//

import UIKit

final class ResultView: BaseView {

    // MARK: UI Components
    private let resultLabel = UILabel().then {
        $0.text = "내가 고른 수박은?"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    }

    private let waterMelonImageView = UIImageView().then {
        $0.backgroundColor = .lightGray
    }

    private let waterMelonLabel = UILabel().then {
        $0.text = "맛없는 수박"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 18, weight: .bold)
    }

    private let descriptLabel = UILabel().then {
        $0.text = "달콤함을 기대하지 마세요.. 씁쓸할 거에요."
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 16, weight: .medium)
    }

    private let resultDetailView = ResultDetailView()

    // MARK: Properties
    let waterMelonDataList: [WaterMelonData] = WaterMelonData.waterMelonDataList

    // MARK: Configuration
    override func configureSubviews() {
        resultDetailView.setData(waterMelonDataList: waterMelonDataList)

        addSubview(resultLabel)
        addSubview(waterMelonImageView)
        addSubview(waterMelonLabel)
        addSubview(descriptLabel)
        addSubview(resultDetailView)
    }

    // MARK: Layout
    override func makeConstraints() {
        resultLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).inset(48)
            $0.centerX.equalToSuperview()
        }

        waterMelonImageView.snp.makeConstraints {
            $0.top.equalTo(resultLabel.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(180)
        }

        waterMelonLabel.snp.makeConstraints {
            $0.top.equalTo(waterMelonImageView.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }

        descriptLabel.snp.makeConstraints {
            $0.top.equalTo(waterMelonLabel.snp.bottom).offset(12)
            $0.centerX.equalToSuperview()
        }

        resultDetailView.snp.makeConstraints {
            $0.top.equalTo(descriptLabel.snp.bottom).offset(12)
            $0.width.equalToSuperview()
        }
    }

    // MARK: Event
}
