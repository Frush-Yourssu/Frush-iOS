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

    public static var waterMelon: UIImage { .load(name: "water_melon") }
    public static var waterMelon1: UIImage { .load(name: "water_melon_1") }
    public static var waterMelon2: UIImage { .load(name: "water_melon_2") }
    public static var waterMelon3: UIImage { .load(name: "water_melon_3") }
    public static var waterMelon4: UIImage { .load(name: "water_melon_4") }

    public static var koreanMelon: UIImage { .load(name: "korean_melon") }
    public static var koreanMelon1: UIImage { .load(name: "korean_melon_1") }
    public static var koreanMelon2: UIImage { .load(name: "korean_melon_2") }
    public static var koreanMelon3: UIImage { .load(name: "korean_melon_3") }
    public static var koreanMelon4: UIImage { .load(name: "korean_melon_4") }

    public static var peach: UIImage { .load(name: "peach") }
    public static var peach1: UIImage { .load(name: "peach_1") }
    public static var peach2: UIImage { .load(name: "peach_2") }
    public static var peach3: UIImage { .load(name: "peach_3") }
    public static var peach4: UIImage { .load(name: "peach_4") }
}

public enum FrushButton {
    public static var backButton: UIImage { .load(name: "back_button") }
    public static var dismissButton: UIImage { .load(name: "dismiss_button") }
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
