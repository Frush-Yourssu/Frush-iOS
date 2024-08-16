//
//  MainViewController.swift
//  Frush
//
//  Created by 박지윤 on 8/16/24.
//

import UIKit

final class MainViewController: BaseViewController {

    // MARK: UI Components
    private let mainView = MainView()

    // MARK: Environment
    private let router = BaseRouter()

    // MARK: Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        router.viewController = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationItem()
    }

    // MARK: Configuration
    override func configureSubviews() {
        view.backgroundColor = .white

        view.addSubview(mainView)

        mainView.tapWaterMelonButton = { [weak self] in
            guard let self else { return }
            router.presentWaterMelonViewController()
        }

        mainView.tapKoreanMelonButton = { [weak self] in
            guard let self else { return }
            router.presentKoreanMelonViewController()
        }

        mainView.tapPeachButton = { [weak self] in
            guard let self else { return }
            router.presentPeachViewController()
        }
    }

    // MARK: Layout
    override func makeConstraints() {
        mainView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
    }

    // MARK: Navigation Item
    private func setNavigationItem() {
        navigationItem.titleView = UIImageView(image: FrushImage.frushLogo)
    }
}
