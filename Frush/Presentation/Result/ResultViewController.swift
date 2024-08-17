//
//  ResultViewController.swift
//  Frush
//
//  Created by 박지윤 on 8/16/24.
//

import UIKit

final class ResultViewController: BaseViewController {

    let category: String

    // MARK: UI Components
    private let resultView = ResultView()

    private let dismissButton = BaseButton().then {
        $0.setImage(FrushButton.dismissButton, for: .normal)
    }

    // MARK: Environment
    private let router = BaseRouter()

    // MARK: Init
    init(category: String) {
        self.category = category
        super.init(nibName: nil, bundle: nil)
        setData(category: category)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationItem()

        router.viewController = self
    }

    // MARK: Configuration
    override func configureSubviews() {
        view.addSubview(resultView)

        dismissButton.tap = { [weak self] in
            guard let self else { return }
            router.popToRootViewController()
        }
    }

    // MARK: Layout
    override func makeConstraints() {
        resultView.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(16)
        }
    }

    // MARK: Navigation Item
    private func setNavigationItem() {
        navigationItem.titleView = UIImageView(image: FrushImage.frushLogo)
        navigationItem.hidesBackButton = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: dismissButton)
    }

    private func setData(category: String) {
        resultView.setData(category: category)
    }
}
