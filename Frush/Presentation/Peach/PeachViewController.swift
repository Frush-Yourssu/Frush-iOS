//
//  PeachViewController.swift
//  Frush
//
//  Created by 박지윤 on 8/16/24.
//

import UIKit

final class PeachViewController: BaseViewController {

    // MARK: UI Components
    private let backButton = BaseButton().then {
        $0.setImage(FrushButton.backButton, for: .normal)
    }

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
        backButton.tap = { [weak self] in
            guard let self else { return }
            router.dismissViewController()
        }
    }

    // MARK: Layout
    override func makeConstraints() {
    }

    // MARK: Navigation Item
    private func setNavigationItem() {
        navigationItem.title = "복숭아"
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
    }
}
