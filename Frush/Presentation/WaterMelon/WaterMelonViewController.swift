//
//  WaterMelonViewController.swift
//  Frush
//
//  Created by 박지윤 on 8/16/24.
//

import UIKit

final class WaterMelonViewController: BaseViewController {

    // MARK: UI Components
    private let backButton = BaseButton().then {
        $0.setImage(FrushButton.backButton, for: .normal)
    }

    private let waterMelonView = WaterMelonView()

    // MARK: Environment
    private let router = BaseRouter()

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationItem()

        router.viewController = self
    }

    // MARK: Configuration
    override func configureSubviews() {
        view.addSubview(waterMelonView)

        backButton.tap = { [weak self] in
            guard let self else { return }
            router.dismissViewController()
        }

        waterMelonView.tapStartButton = { [weak self] in
            guard let self else { return }
            router.presentFirstStepViewController()
        }
    }

    // MARK: Layout
    override func makeConstraints() {
        waterMelonView.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(16)
        }
    }

    // MARK: Navigation Item
    private func setNavigationItem() {
        navigationItem.titleView = UIImageView(image: FrushImage.frushLogo)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
    }
}
