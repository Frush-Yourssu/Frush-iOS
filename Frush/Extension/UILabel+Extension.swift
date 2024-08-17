//
//  UILabel+Extension.swift
//  Frush
//
//  Created by 박지윤 on 8/17/24.
//

import UIKit

extension UILabel {
    func setDefaultLabel(_ inputText: String) {
        text = inputText
        textColor = .black
        font = UIFont(name: "GmarketSansTTFBold", size: 20)
    }
}
