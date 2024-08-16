//
//  FirstStepViewController.swift
//  Frush
//
//  Created by 박지윤 on 8/16/24.
//

import UIKit

final class FirstStepViewController: BaseViewController {

    let guideText: String
    let frushImage: UIImage

    // MARK: UI Components
    private let backButton = BaseButton().then {
        $0.setImage(FrushButton.backButton, for: .normal)
    }

    private let firstStepView = FirstStepView()

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
        view.addSubview(firstStepView)

        backButton.tap = { [weak self] in
            guard let self else { return }
            router.dismissViewController()
        }

        firstStepView.tapCameraButton = { [weak self] in
            guard let self else { return }
            switch frushImage {
            case FrushImage.waterMelonStep1:
                router.presentCameraViewController(category: "waterMelon", step: 1, layerImage: FrushImage.waterMelonLayer1)
            case FrushImage.koreanMelonStep1:
                router.presentCameraViewController(category: "koreanMelon", step: 1, layerImage: FrushImage.koreanMelonLayer1)
            case FrushImage.peachStep1:
                router.presentCameraViewController(category: "peach", step: 1, layerImage: FrushImage.peach)
            default:
                return
            }
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

    private func setFrushView() {
        firstStepView.setData(guideText: guideText, frushImage: frushImage)
    }
}
