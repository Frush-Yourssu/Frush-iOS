//
//  FrushService.swift
//  Frush
//
//  Created by 박지윤 on 8/17/24.
//

import Foundation
import Moya

final class FrushService {

    private var frushProvider = MoyaProvider<FrushAPI>(plugins: [MoyaLoggerPlugin()])

    private enum ResponseData {
        case postFruit
    }

    public func postFruit(fruit: String, fruitPart: String, image: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        frushProvider.request(.postFruit(fruit: fruit, fruitPart: fruitPart, image: image)) { result in
            switch result {
            case .success(let response):
                let statusCode = response.statusCode
                let data = response.data

                let networkResult = self.judgeStatus(by: statusCode, data, responseData: .postFruit)
                completion(networkResult)

            case .failure(let error):
                print(error)
            }
        }
    }

    private func judgeStatus(by statusCode: Int, _ data: Data, responseData: ResponseData) -> NetworkResult<Any> {
        let decoder = JSONDecoder()

        switch statusCode {
        case 200..<300:
            switch responseData {
            case .postFruit:
                return isValidData(data: data, responseData: responseData)
            }
        case 400..<500:
            guard let decodedData = try? decoder.decode(ErrorResponse.self, from: data) else {
                return .pathErr
            }
            return .requestErr(decodedData)
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
    }

    private func isValidData(data: Data, responseData: ResponseData) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        
        switch responseData {
        case .postFruit:
            let decodedData = try? decoder.decode(FrushResponse.self, from: data)
            return .success(decodedData ?? "success")
        }
    }
}
