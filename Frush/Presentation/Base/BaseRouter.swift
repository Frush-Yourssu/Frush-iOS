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

    func presentThirdStepViewController() {
        let thirdStepViewController = ThirdStepViewController()
        viewController?.navigationController?.pushViewController(thirdStepViewController, animated: true)
    }

    //
    func presentKoreanWaterMelonFirstStepViewController() {
        let koreanMelonFirstStepViewController = KoreanMelonFirstStepViewController()
        viewController?.navigationController?.pushViewController(koreanMelonFirstStepViewController, animated: true)
    }

    func presentKoreanWaterMelonSecondStepViewController() {
        let koreanMelonSecondStepViewController = KoreanMelonSecondStepViewController()
        viewController?.navigationController?.pushViewController(koreanMelonSecondStepViewController, animated: true)
    }

    func presentKoreanWaterMelonThirdStepViewController() {
        let koreanMelonThirdStepViewController = KoreanMelonThirdStepViewController()
        viewController?.navigationController?.pushViewController(koreanMelonThirdStepViewController, animated: true)
    }

    func presentCameraViewController() {
        let cameraViewController = CameraViewController()
        viewController?.navigationController?.pushViewController(cameraViewController, animated: true)
    }

    func presentCameraViewController2() {
        let cameraViewController2 = CameraViewController2()
        viewController?.navigationController?.pushViewController(cameraViewController2, animated: true)
    }

    func presentCameraViewController3() {
        let cameraViewController3 = CameraViewController3()
        viewController?.navigationController?.pushViewController(cameraViewController3, animated: true)
    }

    //
    func presentKoreanMelonCameraViewController() {
        let koreanWaterMelonCameraViewController = KoreanWaterMelonCameraViewController()
        viewController?.navigationController?.pushViewController(koreanWaterMelonCameraViewController, animated: true)
    }

    func presentKoreanMelonCameraViewController2() {
        let koreanWaterMelonCameraViewController2 = KoreanWaterMelonCameraViewController2()
        viewController?.navigationController?.pushViewController(koreanWaterMelonCameraViewController2, animated: true)
    }

    func presentKoreanMelonCameraViewController3() {
        let cameraViewController3 = CameraViewController3()
        viewController?.navigationController?.pushViewController(cameraViewController3, animated: true)
    }


    func presentLoadingViewController() {
        let loadingViewController = LoadingViewController()
        viewController?.navigationController?.pushViewController(loadingViewController, animated: true)
    }

    func dismissViewController() {
        viewController?.navigationController?.popViewController(animated: true)
    }
}
