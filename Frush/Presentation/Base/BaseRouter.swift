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

    func presentNextStepViewController(nextStepViewController: BaseViewController) {
        viewController?.navigationController?.pushViewController(nextStepViewController, animated: true)
    }

    func presentCameraViewController(category: String, step: Int, layerImage: UIImage) {
        let cameraViewController = CameraViewController(category: category, step: step, layerImage: layerImage)
        viewController?.navigationController?.pushViewController(cameraViewController, animated: true)
    }

    func presentLoadingViewController(category: String) {
        let loadingViewController = LoadingViewController(category: category)
        viewController?.navigationController?.pushViewController(loadingViewController, animated: true)
    }

    func presentResultViewController(category: String) {
        let resultViewController = ResultViewController(category: category)
        viewController?.navigationController?.pushViewController(resultViewController, animated: true)
    }

    func dismissViewController() {
        viewController?.navigationController?.popViewController(animated: true)
    }

    func popToRootViewController() {
        viewController?.navigationController?.popToRootViewController(animated: true)
    }
}
