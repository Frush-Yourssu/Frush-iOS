//
//  ResultContentView.swift
//  Frush
//
//  Created by 박지윤 on 8/16/24.
//

import UIKit

final class ResultContentView: BaseView {

    // MARK: Init
    init(category: String, similarity: Double) {
        super.init(frame: .zero)

        setData(category: category, similarity: similarity)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: UI Components
    private let categoryLabel = UILabel().then {
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
    }

    private let progressBackgroundView = UIStackView().then {
        $0.backgroundColor = .lightGray
        $0.layer.cornerRadius = 5
    }

    private let progressView = UIView().then {
        $0.backgroundColor = .frushOrange
        $0.layer.cornerRadius = 5
        $0.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
    }

    private let emptyView = UIView()

    private let similarityLabel = UILabel().then {
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 14, weight: .medium)
    }

    // MARK: Configuration
    override func configureSubviews() {
        addSubview(categoryLabel)
        addSubview(progressBackgroundView)
        addSubview(similarityLabel)

        progressBackgroundView.addArrangedSubviews(progressView, emptyView)
    }

    // MARK: Layout
    override func makeConstraints() {
        snp.makeConstraints {
            $0.height.equalTo(21)
        }

        categoryLabel.snp.makeConstraints {
            $0.leading.verticalEdges.equalToSuperview()
        }

        progressBackgroundView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.height.equalTo(8)
            $0.width.equalTo(197)
        }

        progressView.snp.makeConstraints {
            $0.leading.equalToSuperview()
        }

        similarityLabel.snp.makeConstraints {
            $0.trailing.verticalEdges.equalToSuperview()
        }
    }

    private func setData(category: String, similarity: Double) {
        let screenWidth = UIScreen.main.bounds.size.width - 197
        let width = screenWidth * similarity / 100

        progressView.snp.makeConstraints {
            $0.width.equalTo(width)
        }

        categoryLabel.text = category
        similarityLabel.text = "\(Int(similarity))%"
    }
}
