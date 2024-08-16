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

    func presentWaterMelonViewController() {
        let waterMelonViewController = WaterMelonViewController()
        viewController?.navigationController?.pushViewController(waterMelonViewController, animated: true)
    }

    func presentKoreanMelonViewController() {
        let koreanMelonViewController = KoreanMelonViewController()
        viewController?.navigationController?.pushViewController(koreanMelonViewController, animated: true)
    }

    func presentPeachViewController() {
        let peachViewController = PeachViewController()
        viewController?.navigationController?.pushViewController(peachViewController, animated: true)
    }

    func presentFirstStepViewController() {
        let firstStepViewController = FirstStepViewController()
        viewController?.navigationController?.pushViewController(firstStepViewController, animated: true)
    }

    func presentSecondStepViewController() {
        let secondStepViewController = SecondStepViewController()
        viewController?.navigationController?.pushViewController(secondStepViewController, animated: true)
    }

    func presentCameraViewController() {
        let cameraViewController = CameraViewController()
        viewController?.navigationController?.pushViewController(cameraViewController, animated: true)
    }

    func dismissViewController() {
        viewController?.navigationController?.popViewController(animated: true)
    }
}
