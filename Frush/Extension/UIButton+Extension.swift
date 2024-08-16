//
//  UIButton+Extension.swift
//  Frush
//
//  Created by 박지윤 on 8/16/24.
//

import UIKit

extension UIButton {
    func setDefaultButton(_ inputTitle: String) {
        setTitle(inputTitle, for: .normal)
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        backgroundColor = .frushOrange
        layer.cornerRadius = 10

        snp.makeConstraints {
            $0.height.equalTo(52)
        }
    }
}
