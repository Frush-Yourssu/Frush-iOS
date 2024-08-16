//
//  UIStackView+Extension.swift
//  Frush
//
//  Created by 박지윤 on 8/16/24.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach { addArrangedSubview($0) }
    }
}
