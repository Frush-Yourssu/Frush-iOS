//
//  FrushViewController.swift
//  Frush
//
//  Created by 박지윤 on 8/17/24.
//

import UIKit

final class FrushViewController: BaseViewController {

    let guideText: String
    let frushImage: UIImage

    // MARK: UI Components
    private let backButton = BaseButton().then {
        $0.setImage(FrushButton.backButton, for: .normal)
    }

    private let frushView = FrushView()

    // MARK: Environment
    private let router = BaseRouter()

    // MARK: Init
    init(guideText: String, frushImage: UIImage) {
        self.guideText = guideText
        self.frushImage = frushImage
        super.init(nibName: nil, bundle: nil)
        setFrushView()
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
        view.addSubview(frushView)

        backButton.tap = { [weak self] in
            guard let self else { return }
            router.dismissViewController()
        }

        frushView.tapStartButton = { [weak self] in
            guard let self else { return }
            switch frushImage {
            case FrushImage.waterMelon:
                router.presentNextStepViewController(
                    nextStepViewController: FirstStepViewController(
                        guideText: Frush.WATER_MELON.fruitStep.step[0],
                        frushImage: Frush.WATER_MELON.fruitStep.stepImage[0])
                )
            case FrushImage.orientalMelon:
                router.presentNextStepViewController(
                    nextStepViewController: FirstStepViewController(
                        guideText: Frush.ORIENTAL_MELON.fruitStep.step[0],
                        frushImage: Frush.ORIENTAL_MELON.fruitStep.stepImage[0])
                )
            case FrushImage.peach:
                router.presentNextStepViewController(
                    nextStepViewController: FirstStepViewController(
                        guideText: Frush.PEACH.fruitStep.step[0],
                        frushImage: Frush.PEACH.fruitStep.stepImage[0])
                )
            default:
                return
            }
        }
    }

    // MARK: Layout
    override func makeConstraints() {
        frushView.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(16)
        }
    }

    // MARK: Navigation Item
    private func setNavigationItem() {
        navigationItem.titleView = UIImageView(image: FrushImage.frushLogo)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
    }

    private func setFrushView() {
        frushView.setData(guideText: guideText, frushImage: frushImage)
    }
}
