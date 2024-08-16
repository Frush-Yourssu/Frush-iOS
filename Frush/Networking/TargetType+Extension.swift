//
//  TargetType+Extension.swift
//  Frush
//
//  Created by 박지윤 on 8/17/24.
//

import Foundation

import Moya

extension TargetType {
    var baseURL: URL {
        URL(string: "http://10.21.20.56:8080")!
    }
    
    var headers: [String : String]? {
        let header = [
            "Content-Type": "application/json"
        ]
        return header
    }
}
