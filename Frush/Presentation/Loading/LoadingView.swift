//
//  LoadingView.swift
//  Frush
//
//  Created by 박지윤 on 8/16/24.
//

import UIKit

final class LoadingView: BaseView {

    // MARK: UI Components
    private let loadingLabel = UILabel().then {
        $0.text = "결과를 분석 중입니다.."
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    }

    // MARK: Properties

    // MARK: Configuration
    override func configureSubviews() {
        addSubview(loadingLabel)
    }

    // MARK: Layout
    override func makeConstraints() {
        loadingLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).inset(56)
            $0.centerX.equalToSuperview()
        }
    }

    // MARK: Event
}
