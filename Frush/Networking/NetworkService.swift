//
//  NetworkService.swift
//  Frush
//
//  Created by 박지윤 on 8/17/24.
//

final class NetworkService {
    static let shared = NetworkService()
    
    private init() { }

    let frush = FrushService()
}
