//
//  WaterMelonViewController.swift
//  Frush
//
//  Created by 박지윤 on 8/16/24.
//

import UIKit

final class WaterMelonViewController: BaseViewController {

    // MARK: UI Components

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationItem()
    }

    // MARK: Configuration
    override func configureSubviews() {
    }

    // MARK: Layout
    override func makeConstraints() {
    }

    // MARK: Navigation Item
    private func setNavigationItem() {
        navigationItem.title = "수박"
    }
}
