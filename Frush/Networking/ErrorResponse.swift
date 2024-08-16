//
//  ErrorResponse.swift
//  Frush
//
//  Created by 박지윤 on 8/17/24.
//

struct ErrorResponse: Codable {
    let timeStamp: String?
    let status: Int?
    let error: String?
    let message: String?
}
