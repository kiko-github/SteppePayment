//
//  ConnectionManager.swift
//  SteppePayment
//
//  Created by tugsu on 2022.02.07.
//

import Foundation
import Alamofire

let baseUrl = "https://arenadevapi.devorchin.com/v1"
let token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJtZXJjaGFudCI6eyJfaWQiOiI2MWIwMjEwZDRmNmJkNzMxYzdiMTFjMzEiLCJuYW1lIjoiU3RlcHBlQXJlbmEgZGV2IG1lcmNoYW50In0sInVzZXIiOnsidXNlcm5hbWUiOiIxZDU2MTY4MC0xNTQwLTRiNmQtYWVkOS0xMDc0OWViNDU5NTgiLCJfaWQiOiI2MWIwMjk5OGM1OWI1YWQzNDhkMGEzZTQifSwiaWF0IjoxNjM5MDI5MTk3fQ.SdlsHrHfuRdfvYGWQ6W_whwQJPGKdCI5nWyuqWAzqCc"

class ConnectionManager<T: BaseResponse>: NSObject {
    static func get(using url: String, success: @escaping (T) -> Void, failure: @escaping ConnectionFailure) {
        var request = URLRequest(url: URL(string: baseUrl + url)!)
        request.httpMethod = HTTPMethod.get.rawValue
        request.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.timeoutInterval = 120
        request.cachePolicy = .reloadRevalidatingCacheData
        let afRequest = Alamofire.request(request)
        
        afRequest.responseJSON {
            response in switch response.result {
            case .success(let value):
                if let json = value as? [String: Any] {
                    print(json["Result"] as? Int)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension Encodable {
    var toJsonString: String {
        let jsonEncoder = JSONEncoder()
        jsonEncoder.outputFormatting = .prettyPrinted
        guard let jsonData = try? jsonEncoder.encode(self) else { return "" }
        return String(data: jsonData, encoding: .utf8)!
    }
}
