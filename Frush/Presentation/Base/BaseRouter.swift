//
//  BaseRouter.swift
//  Frush
//
//  Created by 박지윤 on 8/16/24.
//

import UIKit

final class BaseRouter {
    // MARK: Properties
    weak var viewController: UIViewController?
    
    // MARK: Routing - present
    func presentSomeViewController() {
        let someViewController = UIViewController()
        someViewController.view.backgroundColor = .white
        viewController?.present(someViewController, animated: true)
    }

    func presentFrushViewController(guideText: String, frushImage: UIImage) {
        let frushViewController = FrushViewController(guideText: guideText, frushImage: frushImage)
        viewController?.navigationController?.pushViewController(frushViewController, animated: true)
    }

    func presentFirstStepViewController(guideText: String, frushImage: UIImage) {
        let firstStepViewController = FirstStepViewController(guideText: guideText, frushImage: frushImage)
        viewController?.navigationController?.pushViewController(firstStepViewController, animated: true)
    }

    func presentSecondStepViewController(guideText: String, frushImage: UIImage) {
        let secondStepViewController = SecondStepViewController(guideText: guideText, frushImage: frushImage)
        viewController?.navigationController?.pushViewController(secondStepViewController, animated: true)
    }

    func presentThirdStepViewController(guideText: String, frushImage: UIImage) {
        let thirdStepViewController = ThirdStepViewController(guideText: guideText, frushImage: frushImage)
        viewController?.navigationController?.pushViewController(thirdStepViewController, animated: true)
    }

    func presentCameraViewController(category: String, step: Int) {
        let cameraViewController = CameraViewController(category: category, step: step)
        viewController?.navigationController?.pushViewController(cameraViewController, animated: true)
    }

    func presentLoadingViewController() {
        let loadingViewController = LoadingViewController()
        viewController?.navigationController?.pushViewController(loadingViewController, animated: true)
    }

    func dismissViewController() {
        viewController?.navigationController?.popViewController(animated: true)
    }
}
