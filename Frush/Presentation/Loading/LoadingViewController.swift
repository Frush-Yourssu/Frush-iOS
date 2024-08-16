//
//  LoadingViewController.swift
//  Frush
//
//  Created by 박지윤 on 8/16/24.
//

import UIKit

final class LoadingViewController: BaseViewController {

    // MARK: UI Components
    private let loadingView = LoadingView()

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationItem()

        router.viewController = self
    }

    // MARK: Environment
    private let router = BaseRouter()

    // MARK: Configuration
    override func configureSubviews() {
        view.addSubview(loadingView)

        loadingView.tapNextButton = { [weak self] in
            guard let self else { return }
            router.presentResultViewController()
        }
    }

    // MARK: Layout
    override func makeConstraints() {
        loadingView.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(16)
        }
    }

    // MARK: Navigation Item
    private func setNavigationItem() {
        navigationItem.titleView = UIImageView(image: FrushImage.frushLogo)
        navigationItem.hidesBackButton = true
    }
}
