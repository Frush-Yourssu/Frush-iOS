//
//  ImageLiteral.swift
//  Frush
//
//  Created by 박지윤 on 8/16/24.
//

import UIKit

public enum FrushImage {
    public static var frushLogo: UIImage { .load(name: "frush_logo") }
    public static var firstProgressBar: UIImage { .load(name: "first_progress_bar") }
    public static var secondProgressBar: UIImage { .load(name: "second_progress_bar") }
    public static var thirdProgressBar: UIImage { .load(name: "third_progress_bar") }
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
