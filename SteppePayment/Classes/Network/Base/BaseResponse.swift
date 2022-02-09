//
//  BaseResponse.swift
//  SteppePayment
//
//  Created by tugsu on 2022.02.07.
//

import Foundation

typealias ConnectionFailure = (String) -> Void
typealias Option = OptionListResponse.Option
typealias VoidResponse = () -> Void

class BaseResponse: Codable {
    var code: Int?
    var message: String?
}
