//
//  SecondStepViewController.swift
//  Frush
//
//  Created by 박지윤 on 8/16/24.
//

import UIKit

final class SecondStepViewController: BaseViewController {

    let guideText: String
    let frushImage: UIImage

    // MARK: UI Components
    private let backButton = BaseButton().then {
        $0.setImage(FrushButton.backButton, for: .normal)
    }

    private let secondStepView = SecondStepView()

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
        view.addSubview(secondStepView)

        backButton.tap = { [weak self] in
            guard let self else { return }
            router.dismissViewController()
        }

        secondStepView.tapCameraButton = { [weak self] in
            guard let self else { return }
            switch frushImage {
            case FrushImage.waterMelonStep2:
                router.presentCameraViewController(category: "waterMelon", step: 2, layerImage: FrushImage.waterMelonLayer2)
            case FrushImage.orientalMelonStep2:
                router.presentCameraViewController(category: "orientalMelon", step: 2, layerImage: FrushImage.orientalMelonLayer1)
            case FrushImage.peachStep2:
                router.presentCameraViewController(category: "peach", step: 2, layerImage: FrushImage.peachLayer1)
            default:
                return
            }
        }
    }

    // MARK: Layout
    override func makeConstraints() {
        secondStepView.snp.makeConstraints {
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
        secondStepView.setData(guideText: guideText, frushImage: frushImage)
    }
}
