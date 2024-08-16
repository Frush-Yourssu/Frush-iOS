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

    let category: String
    let step: Int
    let layerImage: UIImage

    // MARK: UI Components
    private let backButton = BaseButton().then {
        $0.setImage(FrushButton.backButton, for: .normal)
    }

    private let overlayView: UIImageView = {
        let overlayView = UIImageView()
//        overlayView.image = self.layerImage
        overlayView.isHidden = true
        return overlayView
    }()

    private let guideLabel = UILabel().then {
        $0.setDefaultLabel("가이드 맞춰 촬영해주세요!")
    }

    // MARK: Environment
    private let router = BaseRouter()

    // MARK: Init
    init(category: String, step: Int, layerImage: UIImage) {
        self.category = category
        self.step = step
        self.layerImage = layerImage

        super.init(nibName: nil, bundle: nil)

        setOverlayView()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

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
    private func setOverlayView() {
        overlayView.image = layerImage
    }

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
                pickerController.view.addSubview(self!.guideLabel)


                if(self?.category == "koreanMelon"){
                    self?.overlayView.snp.makeConstraints {
                        $0.center.equalToSuperview()
                        $0.width.equalTo(200)
                        $0.height.equalTo(250)
                    }
                }else{
                    self?.overlayView.snp.makeConstraints {
                        $0.center.equalToSuperview()
                        $0.width.height.equalTo(300)
                    }
                }

                self?.guideLabel.snp.makeConstraints {
                    $0.centerX.equalToSuperview()
                    $0.top.equalToSuperview().inset(179)
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

//        let encodedImage = image.base64
//        postFruit(fruit: "WATER_MELON",
//                  fruitPart: "WATER_MELON_CIRCULAR",
//                  image: encodedImage)
        picker.dismiss(animated: true, completion: nil)

        switch category {
        case "waterMelon":
            switch step {
            case 1:
                router.presentSecondStepViewController(
                    guideText: "동그란 수박이 맛있다!",
                    frushImage: FrushImage.waterMelonStep2)
            case 2:
                router.presentThirdStepViewController(
                    guideText: "줄무늬가 뚜렷한 수박이 맛있다!",
                    frushImage: FrushImage.waterMelonStep3)
            case 3:
                router.presentLoadingViewController()
            default:
                return
            }
        case "koreanMelon":
            switch step {
            case 1:
                router.presentSecondStepViewController(
                    guideText: "타원형 참외가 맛있다!",
                    frushImage: FrushImage.koreanMelonStep2)
            case 2:
                router.presentThirdStepViewController(
                    guideText: "상처가 없는 참외가 맛있다!",
                    frushImage: FrushImage.koreanMelonStep3)
            case 3:
                router.presentLoadingViewController()
            default:
                return
            }
        case "peach":
            switch step {
            case 1:
                router.presentSecondStepViewController(
                    guideText: "복숭아 골이 선명하고\n좌우 대칭이어야 맛있다!",
                    frushImage: FrushImage.peachStep2)
            case 2:
                router.presentThirdStepViewController(
                    guideText: "상처가 없는 복숭아가 맛있다!",
                    frushImage: FrushImage.peachStep3)
            case 3:
                router.presentLoadingViewController()
            default:
                return
            }
        default:
            return
        }
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
