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
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    }

    private let frushImageView = UIImageView()

    private let frushTitleLabel = UILabel().then {
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 18, weight: .bold)
    }

    private let descriptLabel = UILabel().then {
        $0.textColor = .black
        $0.textAlignment = .center
        $0.numberOfLines = 2
        $0.font = UIFont.systemFont(ofSize: 16, weight: .medium)
    }

    private let resultDetailView = ResultDetailView()

    // MARK: Properties

    // MARK: Configuration
    override func configureSubviews() {
        resultDetailView.setData(frushResponseDataList: FrushRealData.frushRealDataList)

        addSubview(resultLabel)
        addSubview(frushImageView)
        addSubview(frushTitleLabel)
        addSubview(descriptLabel)
        addSubview(resultDetailView)
    }

    // MARK: Layout
    override func makeConstraints() {
        resultLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).inset(48)
            $0.centerX.equalToSuperview()
        }

        frushImageView.snp.makeConstraints {
            $0.top.equalTo(resultLabel.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(180)
        }

        frushTitleLabel.snp.makeConstraints {
            $0.top.equalTo(frushImageView.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }

        descriptLabel.snp.makeConstraints {
            $0.top.equalTo(frushTitleLabel.snp.bottom).offset(12)
            $0.centerX.equalToSuperview()
        }

        resultDetailView.snp.makeConstraints {
            $0.top.equalTo(descriptLabel.snp.bottom).offset(25)
            $0.width.equalToSuperview()
        }
    }

    // MARK: Event

    func setData(category: String) {
        var total = 0
        var average = 0

        for frushRealData in FrushRealData.frushRealDataList {
            let similarity = Int(frushRealData.similarity)
            
            total += similarity
        }

        average = total / 3

        switch category {
        case "waterMelon":
            resultLabel.text = "내가 고른 수박은?"
            switch average {
            case 0...25:
                frushImageView.image = FrushImage.waterMelon1
                frushTitleLabel.text = ResultData.waterMelonResultList[0].title
                descriptLabel.text = ResultData.waterMelonResultList[0].description
            case 26...50:
                frushImageView.image = FrushImage.waterMelon2
                frushTitleLabel.text = ResultData.waterMelonResultList[1].title
                descriptLabel.text = ResultData.waterMelonResultList[1].description
            case 51...75:
                frushImageView.image = FrushImage.waterMelon3
                frushTitleLabel.text = ResultData.waterMelonResultList[2].title
                descriptLabel.text = ResultData.waterMelonResultList[2].description
            case 76...100:
                frushImageView.image = FrushImage.waterMelon4
                frushTitleLabel.text = ResultData.waterMelonResultList[3].title
                descriptLabel.text = ResultData.waterMelonResultList[3].description
            default:
                return
            }
        case "orientalMelon":
            resultLabel.text = "내가 고른 수박은?"
            switch average {
            case 0...25:
                frushImageView.image = FrushImage.orientalMelon1
                frushTitleLabel.text = ResultData.orientalMelonResultList[0].title
                descriptLabel.text = ResultData.orientalMelonResultList[0].description
            case 26...50:
                frushImageView.image = FrushImage.orientalMelon2
                frushTitleLabel.text = ResultData.orientalMelonResultList[1].title
                descriptLabel.text = ResultData.orientalMelonResultList[1].description
            case 51...75:
                frushImageView.image = FrushImage.orientalMelon3
                frushTitleLabel.text = ResultData.orientalMelonResultList[2].title
                descriptLabel.text = ResultData.orientalMelonResultList[2].description
            case 76...100:
                frushImageView.image = FrushImage.orientalMelon4
                frushTitleLabel.text = ResultData.orientalMelonResultList[3].title
                descriptLabel.text = ResultData.orientalMelonResultList[3].description
            default:
                return
            }
        case "peachMelon":
            resultLabel.text = "내가 고른 복숭아는?"
            switch average {
            case 0...25:
                frushImageView.image = FrushImage.peach1
                frushTitleLabel.text = ResultData.peachResultList[0].title
                descriptLabel.text = ResultData.peachResultList[0].description
            case 26...50:
                frushImageView.image = FrushImage.peach2
                frushTitleLabel.text = ResultData.peachResultList[1].title
                descriptLabel.text = ResultData.peachResultList[1].description
            case 51...75:
                frushImageView.image = FrushImage.peach2
                frushTitleLabel.text = ResultData.peachResultList[2].title
                descriptLabel.text = ResultData.peachResultList[2].description
            case 76...100:
                frushImageView.image = FrushImage.peach3
                frushTitleLabel.text = ResultData.peachResultList[3].title
                descriptLabel.text = ResultData.peachResultList[3].description
            default:
                return
            }
        default:
            return
        }
    }
}
