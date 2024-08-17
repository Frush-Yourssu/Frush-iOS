//
//  ThirdStepViewController.swift
//  Frush
//
//  Created by 박지윤 on 8/16/24.
//

import UIKit

final class ThirdStepViewController: BaseViewController {

    let guideText: String
    let frushImage: UIImage

    // MARK: UI Components
    private let backButton = BaseButton().then {
        $0.setImage(FrushButton.backButton, for: .normal)
    }

    private let thirdStepView = ThirdStepView()

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
            switch frushImage {
            case FrushImage.waterMelonStep3:
                router.presentCameraViewController(category: "waterMelon", step: 3, layerImage: FrushImage.waterMelonLayer2)
            case FrushImage.orientalMelonStep3:
                router.presentCameraViewController(category: "orientalMelon", step: 3, layerImage: FrushImage.orientalMelonLayer1)
            case FrushImage.peachStep3:
                router.presentCameraViewController(category: "peach", step: 3, layerImage: FrushImage.peachLayer1)
            default:
                return
            }
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

    private func setFrushView() {
        thirdStepView.setData(guideText: guideText, frushImage: frushImage)
    }
}
