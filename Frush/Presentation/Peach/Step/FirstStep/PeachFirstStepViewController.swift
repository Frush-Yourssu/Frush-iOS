//
//  PeachFirstStepViewController.swift
//  Frush
//
//  Created by 성현주 on 8/17/24.
//

import UIKit

final class PeachFirstStepViewController: BaseViewController {

    // MARK: UI Components
    private let backButton = BaseButton().then {
        $0.setImage(FrushButton.backButton, for: .normal)
    }

    private let firstStepView = PeachFirstStepView()

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
        view.addSubview(firstStepView)

        backButton.tap = { [weak self] in
            guard let self else { return }
            router.dismissViewController()
        }

        firstStepView.tapCameraButton = { [weak self] in
            guard let self else { return }
            router.presentPeachCameraViewController()
        }
    }

    // MARK: Layout
    override func makeConstraints() {
        firstStepView.snp.makeConstraints {
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

