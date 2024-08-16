//
//  CameraViewController.swift
//  Frush
//
//  Created by 박지윤 on 8/16/24.
//

import UIKit
import AVFoundation
import Moya

final class CameraViewController: BaseViewController {

    // MARK: UI Components
    private let backButton = BaseButton().then {
        $0.setImage(FrushButton.backButton, for: .normal)
    }

    private let overlayView: UIImageView = {
        let overlayView = UIImageView()
        overlayView.image = UIImage(named: "Ellipse 4")
        overlayView.isHidden = true
        return overlayView
    }()

    // MARK: Environment
    private let router = BaseRouter()


    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        openCamera()

        router.viewController = self
    }

    // MARK: Configuration
    override func configureSubviews() {
        backButton.tap = { [weak self] in
            guard let self else { return }
            router.dismissViewController()
        }
    }

    // MARK: Layout
    override func makeConstraints() {
    }

    // MARK: Events
    private func openCamera() {
        AVCaptureDevice.requestAccess(for: .video) { [weak self] isAuthorized in
            guard isAuthorized else {
                self?.showAlertGoToSetting()
                return
            }

            DispatchQueue.main.async {
                let pickerController = UIImagePickerController()
                pickerController.sourceType = .camera
                pickerController.allowsEditing = false
                pickerController.mediaTypes = ["public.image"]
                pickerController.delegate = self


                pickerController.view.addSubview(self!.overlayView)


                self?.overlayView.snp.makeConstraints {
                    $0.center.equalToSuperview()
                    $0.width.height.equalTo(100)
                }

                self?.overlayView.isHidden = false
                self?.present(pickerController, animated: true)

            }
        }
    }

    func showAlertGoToSetting() {
        let alertController = UIAlertController(
            title: "현재 카메라 사용에 대한 접근 권한이 없습니다.",
            message: "설정 > {앱 이름}탭에서 접근을 활성화 할 수 있습니다.",
            preferredStyle: .alert
        )
        let cancelAlert = UIAlertAction(
            title: "취소",
            style: .cancel
        ) { _ in
            alertController.dismiss(animated: true, completion: nil)
        }
        let goToSettingAlert = UIAlertAction(
            title: "설정으로 이동하기",
            style: .default) { _ in
                guard
                    let settingURL = URL(string: UIApplication.openSettingsURLString),
                    UIApplication.shared.canOpenURL(settingURL)
                else { return }
                UIApplication.shared.open(settingURL, options: [:])
            }
        [cancelAlert, goToSettingAlert]
            .forEach(alertController.addAction(_:))
        DispatchQueue.main.async {
            self.present(alertController, animated: true)
        }
    }
}

//이미지 처리하는 부분
extension CameraViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate, AVCapturePhotoCaptureDelegate {

    func imagePickerController(
        _ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]
    ) {
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            picker.dismiss(animated: true)
            return
        }

        let encodedImage = image.base64
        postFruit(fruit: "WATER_MELON",
                  fruitPart: "WATER_MELON_CIRCULAR",
                  image: encodedImage)

        router.presentSecondStepViewController()
    }
}

// MARK: Networking
extension CameraViewController {
    private func postFruit(fruit: String, fruitPart: String, image: String) {
        print("🍉 postFruit called")
        NetworkService.shared.frush.postFruit(fruit: fruit,
                                              fruitPart: fruitPart,
                                              image: image)
        { result in
            switch result {
            case .success(let response):
                guard let data = response as? FrushResponse else { return }
                print("🍉 postFruit success: " + "\(data)")
            case .requestErr(let errorResponse):
                dump(errorResponse)
                guard let data = errorResponse as? ErrorResponse else { return }
                print(data)
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            case .pathErr:
                print("pathErr")
            }
        }
    }
}
