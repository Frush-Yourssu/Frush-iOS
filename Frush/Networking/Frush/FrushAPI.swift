//
//  FrushAPI.swift
//  Frush
//
//  Created by 박지윤 on 8/17/24.
//

import Moya
import Foundation
import UIKit

enum FrushAPI: TargetType {
    case postFruit(fruit: String, fruitPart: String, image: String)

    var path: String {
        switch self {
        case .postFruit:
            return "/fruits/json"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .postFruit:
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case let .postFruit(fruit, fruit_part, image):
            return .requestParameters(parameters: [
                "fruit": fruit,
                "fruit_part": fruit_part,
                "image": image
            ], encoding: JSONEncoding.default)
        }
    }

    var headers: [String : String]? {
        nil
    }
}
