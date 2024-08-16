//
//  KoreanMelonThirdStepViewController.swift
//  Frush
//
//  Created by 성현주 on 8/17/24.
//
import UIKit

final class KoreanMelonThirdStepViewController: BaseViewController {

    // MARK: UI Components
    private let backButton = BaseButton().then {
        $0.setImage(FrushButton.backButton, for: .normal)
    }

    private let thirdStepView = KoreanMelonThirdStepView()

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
        view.addSubview(thirdStepView)

        backButton.tap = { [weak self] in
            guard let self else { return }
            router.dismissViewController()
        }

        thirdStepView.tapCameraButton = { [weak self] in
            guard let self else { return }
            router.presentKoreanMelonCameraViewController3()
        }
    }

    // MARK: Layout
    override func makeConstraints() {
        thirdStepView.snp.makeConstraints {
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
