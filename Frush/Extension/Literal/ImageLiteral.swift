//
//  ImageLiteral.swift
//  Frush
//
//  Created by 박지윤 on 8/16/24.
//

import UIKit

public enum FrushImage {
}

public enum FrushButton {
    public static var backButton: UIImage { .load(name: "back_button") }
}

public enum FrushIcon {
}

extension UIImage {
    static func load(name: String) -> UIImage {
        guard let image = UIImage(named: name, in: nil, compatibleWith: nil) else {
            return UIImage()
        }
        image.accessibilityIdentifier = name
        return image
    }
}
